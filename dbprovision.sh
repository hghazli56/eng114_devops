#!/bin/bash

#Update, install MongoDB and upgrade
sudo apt-get update -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update -y
sudo apt-get upgrade -y
#sudo apt-get install mongodb-org=3.2.20 -y
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20
#If mongo is is set up correctly these will be successful
sudo systemctl restart mongod
sudo systemctl enable mongod
#sudo mv mongod.conf /etc/mongod.conf


#Edit mongod.conf to replace 127.0.0.1 with 0.0.0.0 so that port 27017 is open on whatever ip the database VM is assigned
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf


#After mongod.conf file is changed, we need to restart and enable mongodb so new configurations are in effect
sudo systemctl restart mongod
sudo systemctl enable mongod




