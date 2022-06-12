#!/bin/bash

# Update and upgrade 
sudo apt-get update -y
sudo apt-get upgrade -y

# Install nginx
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

# Install dependencies
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo apt-get install npm 
sudo npm install pm2 -g
sudo apt-get install python-software-properties -y

# Copy codebase from Github repo
mkdir repo
cd repo
git clone https://github.com/hghazli56/eng114_devops.git
cd eng114_devops/

# Copy premade default file to nginx configuration 
# This will forward the applications original port(3000) to the servers defult port(80) 
sudo mv default /etc/nginx/sites-available/default 

# Restart nginx for configuration to take effect 
sudo systemctl restart nginx

# Next we create the environment variable DB_HOST in order for our app to connect to the database through its ip on port 27017
sudo echo "export DB_HOST='mongodb://3.250.139.104:27017/posts'" >> /etc/bash.bashrc 
source /etc/bash.bashrc

sudo apt npm install





