Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

  # add a private network between localhost & VM using ip
  config.vm.network "private_network", ip: "192.168.10.100"

  config.vm.provision "file", source: "~/week3/file.sh", destination: "$HOME/"

  config.vm.provision "file", source: "~/week3/default", destination: "$HOME/"

  config.vm.synced_folder "./app", "/home/vagrant/app" #This copies contents of app to destination in VM

  config.vm.provision "shell",
    inline: "sudo chmod +x file.sh && sudo ./file.sh"
    
  config.vm.provision "shell",
    inline:"sudo mv default /etc/nginx/sites-available/default && sudo systemctl restart nginx"
end
