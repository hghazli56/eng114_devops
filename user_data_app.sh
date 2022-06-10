#!/bin/bash

# update
sudo apt-get update -y
# upgrade
sudo apt-get upgrade -y
# install nginx
sudo apt-get install nginx -y
# start nginx
sudo systemctl start nginx
# enable nginx
sudo systemctl enable nginx
# install dependencies
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

sudo apt-get install nodejs -y

sudo apt-get install npm 

sudo npm install pm2 -g

sudo apt-get install python-software-properties -y

mkdir repo

cd repo

git clone https://github.com/hghazli56/eng114_devops.git

cd eng114_devops/

sudo mv default /etc/nginx/sites-available/default 

sudo systemctl restart nginx

sudo echo "export DB_HOST='mongodb://3.250.139.104:27017/posts'" >> /etc/bash.bashrc 

source /etc/bash.bashrc

sudo apt npm install





