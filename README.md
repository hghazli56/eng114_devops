# What is DevOps?
<br>
DevOps is the combination of culture, practices and tools that are implemented with the goal of delivering, updating and scaling applications and services quickly and efficiently.

The name DevOps is derived from the words Development and Operations as those who work in DevOps have knowledge in both these areas. 

## Why DevOps? The Benefits
As mentioned above, DevOps is the combination of development and operations.
<br>
<br>
In the past, developers would write their code in one environment then send it to the operations team for deployment. Issues would arise when the application source code would not work as intended on the deployment environment. As operations staff are usually not experienced with troubleshooting code along with development staff not likely to produce code that is "deployment friendly", a blame culture could arise where conflicts can negatively impact productivity, communication and most importantly, sweet, sweet profits.
<br>
<br>
DevOps, if applied effectively, is able to drastically mitigate these issues. With knowledge in both development and operations, DevOps teams become a buffer between both departments. This is achieved through:
<br>
- Building consistent environments to ensure a smooth transition between development and deployment
- Automating repeatable tasks to create a more efficient pipeline
- Mediating issues between developers and operations staff allowing for better communication

### The role of DevOps
Essentially the role of DevOps is to streamline the common processes across stages of the software development life cycle, allowing for effective communication and collaboration between multiple teams. 
<br>
![devops in the sdlc](https://www3.dbmaestro.com/hs-fs/hubfs/chart2.png?width=600&name=chart2.png)

### What is the development environment?
<br>
Whether building a new application or updating/patching an existing one, it is important to ensure that the service is ready for the live environment. A poor release to customers can have disastrous effects on public image, customer loyalty and of course, PROFITS!!
<br>
<br>
A development environment is needed so that teams can monitor, test for and fix issues that are likely to appear when new features or any changes to code are applied and rolled out to the production environment. This allows for teams to ensure the service/application works as indented, thus providing a better quality experience for end users.
<br>
<br>

### The 4 pillars of DevOps
<br>

![4 pillars of devops](https://cdn.rd.gt/wp-content/uploads/2017/10/word-image-21-1024x226.png) 

- Tools: Using the right tools to achieve the goal

- Process: Ensuring an effective chain of tasks that can adapt to often unpredictable real-world circumstances

- People: Understanding that people are at the center of all this (practically the whole point), and aiming to maximize not just communication and collaboration but also the needs of the wide range of stakeholders 

- Culture: With people comes culture and in DevOps it is very important to apply a culture that considers the needs of all parties in the development lifecycle as well as setting rules, customs and expectations with the right balance of order and freedom(along with the occasional chaos) to ensure a consistent value system for everyone involved
<br>
<br>  


### Linux commands
- update & install ubuntu `sudo apt-get update -y`
- upgrade `sudo apt-get upgrade -y`
- install nginx `sudo apt-get install nginx -y`
- check nginx status `sudo systemctl status nginx`
- start or stop nginx `sudo systemctl` with `start` or `stop` or `restart` plus `nginx`
- Who am I `uname -a`
- Where am I `pwd`
- How to check dir/file in current directory: `ls` or `ls -a` for hidden files
- change dir `cd name_of_dir`
- go back one directory `cd ..`
create a file `touch filename.extension` or `vim filename.extension` to go into file straight away
- move file to folder `mv filename foldername/` this is for when the file and folder are at the root of the current directory 
- the copy command is `cp file_path destination`

#### File permissions
- READ `r` WRITE `w` EXECUTE `x`
- how the check file permission `ll`
- change permissions `chmod permission filename` 
- e.g. `chmod +x filename`
- there are also number codes for combinations of permissions 

### Bash Scripting
- create a file called provision.sh
- change permission of this file `chmod +x provision.sh`
- first line MUST BE `#!/bin/bash` 
- update & upgrade
- install nginx
- start nginx
- `enable nginx`
- stop then start
- Command for running script `sudo ./provision.sh`

### Vagrant automation

With Vagrantfile we can set instructions for a managed VM to carry out. Such instructions can  include:

-  `config.vm.box = "ubuntu/xenial64"` This installs a specified os onto the VM

- `config.vm.network "private_network", ip: "192.168.10.100"` This assigns the VM to an IP address within the private network

- `config.vm.provision "file", source: "~/week3/file.sh", destination: "$HOME/"` This uses the "file" provision to copy a file/folder from the local machine to the VM

- `config.vm.provision "shell",
    inline: "sudo chmod +x file.sh  && sudo ./file.sh"` We can also use the "shell" provision to directly run bash commands on the VM



### Bash scripts
If we want to run a command or a group of commands multiple times, we can create a .sh file that stores our commands that we wish to repeat.

- `touch filename.sh` This creates the file

- `vim filename.sh` this allows us to add our commands into the .sh file

- `sudo chmod +x filename.sh` This changes the file permission, allowing us to execute it

- `./filename.sh` Assuming we are in the same directory as the .sh file, we run this command to execute it which will trigger the commands inside to run sequentially

### Creating Variables in Linux
- `vim ~/.bashrc` Opens bashrc file where environment variables can be stored

- Then we edit the bottom of the file with `export ENV='env_value'`

- Save and exit

- `source ~/.bashrc` To load new bashrc configuration with our new variable(s) 

- `printenv <variable name>` Prints value for chosen variable

- Now the environment variable is stored globally and not just for the session

### Nginx forward to port

- The app by default runs on port 3000. We want it to run on the default port. We can do this by editing the default file in `/etc/nginx/sites-available`.

- We then find the location block and replace it with the following lines:
- `proxy_pass http://localhost:3000;` NOTE: Here we enter the original port number that the app ran on
- `proxy_http_version 1.1;`
- `proxy_set_header Upgrade $http_upgrade;`
- `proxy_set_header Connection 'upgrade';`
- `proxy_set_header Host $host;`
- `proxy_cache_bypass $http_upgrade;`
- Then the save the file and run `sudo systemctl restart nginx` to reload nginx with the new configurations
- Now we should be able to access our webapp just by typing the vm ip address without the original port number 

### Processes in Linux

- `top` or `ps aux` Displays list of currently running processes
- `sudo kill <process_id>` stops a specified process
- `|` Is piping where we sort oe short list processes
- `head` and `tail` can be used for top-down or bottom-up

### Connecting webapp to a Database
- First we need to create another VM that will host our DB
- Our DB will run on the same OS as our original VM (Ubuntu 16.04)
- Then we will install the correct version of MongoDB
- Then we will need to allow the required access; by allowing the ip of our app machine to connect to our DB
- In our app machine we will need to create an environment variable called DB_HOST (See file.sh for command)
- We will cd into /etc
- `sudo nano mongod.conf`- By default it allows access to 127.0.0.1 with port 27017
- edit `mongod.conf` to allow app ip or for the ease of use allow all (not best practice for prod env)
- `0.0.0.0` (See mongo.conf file in repo. This conf file will replace the original in the DB vm)
- restart and enable mongodb
- Common errors include:
- DB_HOST not found, env var created on DB machine
- Users should not be allowed to directly access the DB

## Cloud Computing
<br></br>
![Cloud computing diagram](https://miro.medium.com/max/640/1*ngkHgQq7ij1NBNr62er3zA.png) 

- Cloud Computing is the delivery of computing services over the internet via off premise data centres run by the cloud provider

- Customers have access to a wide range of computing services (vms, databases, networking etc.) and commonly pay for how much of these services they use (pay per minute)

- Cloud providers are solely responsible for the physical maintenance and security of hardware and data within their data centres however, their is a shared responsibility model in place depending on the service the customer wants (SaaS, PaaS, IaaS)

### Costs: On-prem vs Cloud
- Starting an on-prem center comes with capital expenditure where an investment in hardware is needed to keep it running (which can be very large)

- There are also operational costs (operational expenditure) that come with on-prem centers which usually include staff salaries, electricity, rent etc.

- On a basic level, using a cloud provider comes only with operational costs. The OpEx business model is sustainable for cloud providers due to economies of scale because of their large-scale hardware deployment    

### Benefits of Cloud Computing 
- No CapEx: Because of the cloud computing business model, it's customers can have systems up and running without a large initial investment

- Flexibility: Customers can quickly start-up (and experiment with) and get rid of resources as their needs and requirements change without any CapEX

- Shared responsibility: Because of the shared responsibility model, cloud customers wil never have to take responsibility for the physical maintenance and security of hardware which also helps with costs

![costs diagram](https://mccinnovations.com/wp-content/uploads/2021/12/OpEx-CapEx-Cloud_Iceberg-1.png) 






### Monolith architecture

- Monolith architecture is the design of code where all functionality occurs in one place (front-end, back-end, database)

- Monolith architecture is suited more for smaller applications that do not need to regularly change (e.g. adding functionality)) and have a small user base

![monolith architecture](https://miro.medium.com/max/714/1*F6y9GeBZwaOzNYnToahfQw.png) 

### Two-Tier architecture

![two-tier architecture](https://miro.medium.com/max/402/1*aQpfQ6s4kd_pKpYnD2xkyQ.png) 

- This is where the data layer is separate from the rest of the code-base e.g. the database runs on a separate machine from the application

### Location based services
![location based services](https://docs.microsoft.com/en-us/azure/availability-zones/media/availability-zones.png) 
- Cloud providers have data centers all around the planet. The benefits of this include:
<br></br>

- Center redundancy (cloud providers have multiple centers in regions known as Availability Zones)

- Reduced latency depending on end user location (clients will want to deploy their systems in data centers that are as close to the user base as possible)

- Keeping in compliance with the data laws of specific regions

### AWS creating instances and instances from Amazon Machine Images (AMIs)
- In the AWS dashboard, select `Services` and choose `ec2`
- Click on `Launch instance` and go through the menu, selecting your desired operating system, compute power, storage, network, subnet, tags and security groups
- Review everything and launch
- You can create security groups by entering `security groups` in the dashboard search bar
- Configure your ec2 however you like (e.g. installing nginx)
- If you want to keep a vm configuration for future use, you can use an AMI (AMIs are more cost efficient than just stopping your ec2)
- To do this, select your instance, click `Actions`, hover over `Image and templates` and select `Create Image`
- Name your AMI and go through the menus (once created, your AMI should be accessible in the side menu under AMIs)
- To create a new ec2 from an AMI, select AMIs(from either the search bar or side menu), highlight your desired AMI and click `Launch instance from AMI` and go through the menus similar to when creating an ec2 from scratch
- Once complete, your new ec2 should be have all the configurations from the image it was based off
- `IMPORTANT NOTE`: Remember to update any security groups with the new ec2s ip where necessary    

### Two-Tier Architecture as of Week 4 Day 4
<br></br>
![location based services](/Images/2tad.png) 

### Amazon S3
- S3 is Amazon AWSs Simple Storage Service

- It focusses on high availability and scalability

- S3 also features storage classes e.g. Standard, Clacier, etc

- Standard class: Data stored is actively available

- Clacier class: Data is available on request and takes time to access (`this is a cheaper option than standard and is recommended for data that is infrequently accessed`)

- Offers CRUD functionality using AWSCLI

- S3 can also be used for disaster recovery (DR) by being globally available

- Make s3 bucket(bucket is an instance of s3) `aws s3 mb s3://eng114-hamza-bucket` - remember to use dashes NOT underscores

- List buckets `aws s3 ls`

- Copy file to s3 bucket `aws s3 cp <filename> s3://<s3-bucket-name>`

- Change permission for files on S3 (AWS web dashboard): `click file you want, click permissions, edit permissions to your liking`

- Download file from S3 bucket to current folder: `aws s3 cp s3://<bucket-name>/<filename> .`

- Delete file from S3 bucket: `aws s3 rm s3://<bucket-name>/<filename>`

- Delete S3 bucket: `aws s3 rb s3://<bucket-name>`

### Using python and boto3 to script S3 commands

- boto3 is a python package that lets us run awscli commands in order to interact with aws recourses (e.g.EC2 and S3)

- We must first have awscli setup with the correct access & secret key configurations

- Then we install boto3 `pip install boto3`

- Then we can create .py files execute our scripts (make sure to import boto3)

- See boto3-python-scripts folder for script examples 


### Dependencies for AWSCLI on EC2
- Python3 or above

- awscli

- pip3

- update & upgrade

- AWS access & secret key for data security

- aws configure: accesskeys, secretkeys, region, language

### Monitoring and Alert Management
- CLOUDWATCH can be used to monitor AWS services and works with SNS (Simple Notification Service)

- SQS (Simple Queue Service) can be used to queue requests so that every request can be logged

- Things we can monitor: error logs, budgeting, uptime, access time, response, time security breaches, system test/health, instance's health, resources(CPU itilisation %)

- There are 4 golden signals to look out for: 

### Create SNS notifications on AWS

- To receive email notifications, you will need to create an alarm in Cloudwatch(for a specific instance click `Actions` on instance page

- Then hover over `Monitor and troubleshoot` and click `Manage cloudwatch alarms`), add conditions and assign to a topic (you can create a new one at this stage under `Alarm notification`)

- Then in SNS click `Subscriptions`, then click `Create subscription`

- Type the topic name you assigned to your alarm under `Topic ARN`

- Under `Protocol`, select `Email` and type the `Endpoint` email address you want to use

- Click `Create subscription` and confirm the subscription when AWS sends an email prompting you to

- Now whenever the alarm conditions are met, that email address will receive a notification

### Create Launch Templates and Autoscaling Groups in AWS 

![location based services](https://miro.medium.com/max/473/1*bNX6_RMgpDEAwQ9l-81rxw.png)

- We usually want to run an online service on multiple, identical servers

- To do this we can use Launch templates

- To create a launch template click on `Launch Templates` under `Instances` in the side menu

- Name your template
 
- Select your base image (can be standalone OS or AMI)
 
- Select the instance type(e.g. t2.micro)

- Add your key under `Key pair(login)` 

- Select a subnet and security groups under `Network settings`

- In `Advanced details` scroll to `user data` and enter any script you want to run on initialisation 

- Click `Create launch template`

- Your template will now be stored in `Launch Templates`

- Now we want to create an auto scaling group

- Click `Auto Scaling Groups` under Auto Scaling

- Name your ASG

- Select the launch template you created earlier and click `Next`

- Select your VPC and any availability zones/ subnets your ASG can use

- Click `Attach to a new load balancer`, select `Application Load Balancer` 

- Click `Internet-facing`

- Under `Listeners and routing`, click `Select new or existing target group` and select or create a new one (this will be the name of your load balancer)

- Click `Next`

- Under `Group size`, select your `Desired capacity`, `Minimum capacity` and `Maximum capacity`

- Under `Scaling policies` click `Target tracking scaling policy` and select your conditions for scaling

- Click `Next` twice and add your tags (these will be the names for your instances)

- Click `Next`, review and finally click `Create Auto Scaling group`

### Setting up alarms for Auto Scaling Groups

- Go to `CloudWatch service` 

- Click `Create alarm`

- Click `Select metric`

- Under `Metrics` click `Auto Scaling`

- Click `Group Metrics`

- Select your metric and fill in your conditions

- Click `Create new topic` and enter `topic name` and ` email endpoint`



### AWS notes
- Naming conventions: `eng114_hghazli_<resouce type>`

- SCP command to copy file from localhost to ec2 on AWS: `scp -i .ssh/<ssh_key_name>.pem -r  path/of/local/file user@target_vm_address:target/path/`

- `sudo kill <pid>` Kills specific process






 










