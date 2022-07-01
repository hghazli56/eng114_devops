######################################################## Create ec2s
resource "aws_instance" "app_instance" {
  ami = "ami-0b47105e3d7fc023e"
  instance_type = "t2.micro"
  key_name = "hmz-ans"

  subnet_id = aws_subnet.terraform_public_subnet.id

  vpc_security_group_ids = ["${aws_security_group.app.id}"]

# server size (t2-micro)

# do we need it to have public access

 associate_public_ip_address = true

# what do we want to name it
 tags = {
    Name = "eng114_hamza_terraform_app"
 }
}

resource "aws_instance" "db_instance" {
  ami = "ami-0c0d1ec1c1277e678"
  instance_type = "t2.micro"
  key_name = "hmz-ans"

  subnet_id = aws_subnet.terraform_private_subnet.id

  vpc_security_group_ids = ["${aws_security_group.db.id}"]

# server size (t2-micro)

# do we need it to have public access


# what do we want to name it
 tags = {
    Name = "eng114_hamza_terraform_db"
 }
}


resource "aws_instance" "controller_instance" {
  ami = "ami-0c74c61a1d4a53305"
  instance_type = "t2.micro"
  key_name = "hmz-ans"

  subnet_id = aws_subnet.terraform_public_subnet.id

  vpc_security_group_ids = ["${aws_security_group.app.id}"]

# server size (t2-micro)

# do we need it to have public access

 associate_public_ip_address = true

# what do we want to name it
 tags = {
    Name = "eng114_hamza_terraform_controller"
 }
}