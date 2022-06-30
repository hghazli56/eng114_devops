# launch a server on ec2

# who is the cloud provider
provider "aws"{

# where do you want to create the resources (eu-west-1)
  region = "eu-west-1"
}


############################################ Create VPC
resource "aws_vpc" "terraform_vpc" {
  cidr_block = "10.0.0.0/16" 
 
  tags = {
    Name = "eng114-hamza-terraform-vpc"
  }
}

############################################ Create Internet Gateway
resource "aws_internet_gateway" "terraform_ig" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name = "eng114-hamza-terraform-igw"
  }
}

############################################ Create Public Subnet (for app)
resource "aws_subnet" "terraform_public_subnet" {
  vpc_id = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.107.0/24"
  availability_zone = "eu-west-1b"
  
  tags = {
    Name = "eng114-hamza-terraform-public-subnet"
  }
}

############################################ Create Private Subnet (for db)
resource "aws_subnet" "terraform_private_subnet" {
  vpc_id = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.118.0/24"
  availability_zone = "eu-west-1b"
  
  tags = {
    Name = "eng114-hamza-terraform-private-subnet"
  }
}

########################################### Route table (public)
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "eng114-hamza-terraform-public-RT"
  }
}

########################################### Route from (public)
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.terraform_ig.id
}


################################################ Subnet assosiations (public)
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.terraform_public_subnet.id
  route_table_id = aws_route_table.public.id
}



# Create 
resource "aws_instance" "app_instance" {
  ami = "ami-0b47105e3d7fc023e"
  instance_type = "t2.micro"
  key_name = "hmz-ans"

  subnet_id = aws_subnet.terraform_public_subnet.id

# server size (t2-micro)

# do we need it to have public access

 associate_public_ip_address = true

# what do we want to name it
 tags = {
    Name = "eng114_hamza_terraform_app"
 }
}