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

### AWS notes
- Naming conventions: `eng114_hghazli_<resouce type>`

- SCP command to copy file from localhost to ec2 on AWS: `scp -i .ssh/<ssh_key_name>.pem -r  path/of/local/file user@target_vm_address:target/path/`





 










