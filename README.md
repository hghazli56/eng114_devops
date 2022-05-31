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

 










