Vagrant.configure("2") do |config|

    config.vm.define "app" do |app|
    app.vm.box = "ubuntu/xenial64"

  # add a private network between localhost & VM using ip
  app.vm.network "private_network", ip: "192.168.10.100"

  app.vm.provision "file", source: "~/week3/file.sh", destination: "$HOME/"

  app.vm.provision "file", source: "~/week3/default", destination: "$HOME/"

  app.vm.synced_folder "./app", "/home/vagrant/app" #This copies contents of app to destination in VM

  app.vm.provision "shell",
    inline: "sudo chmod +x file.sh && sudo ./file.sh"

  end

  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"

  db.vm.network "private_network", ip: "192.168.10.150"

  db.vm.provision "file", source: "~/week3/mongod.conf", destination: "$HOME/"

  db.vm.provision "file", source: "~/week3/dbprovision.sh", destination: "$HOME/"

  db.vm.provision "shell",
    inline: "sudo chmod +x dbprovision.sh && sudo ./dbprovision.sh"

  end

end
