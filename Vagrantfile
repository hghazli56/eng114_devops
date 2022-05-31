Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

  # add a private network between localhost & VM using ip
  config.vm.network "private_network", ip: "192.168.10.100"

  config.vm.provision "file", source: "~/week3/file.sh", destination: "$HOME/"
  
  config.vm.provision "shell",
    inline: "sudo chmod +x file.sh  && sudo ./file.sh"

  
end
