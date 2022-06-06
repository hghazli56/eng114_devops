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

sudo npm install pm2 -g

sudo apt-get install python-software-properties -y

sudo mv default /etc/nginx/sites-available/default # Overwrite original nginx default file with our configuration

sudo systemctl restart nginx

cd app/app/

npm install

npm start -d

exit



