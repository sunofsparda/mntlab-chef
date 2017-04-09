# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "sbeliakou/centos-6.8-x86_64"
    
    # VM1
    config.vm.define :dev do |dev_chef|
      dev_chef.vm.host_name = "dev-chef"
      dev_chef.vm.network "private_network", ip:"192.168.100.101"
      dev_chef.vm.provider :virtualbox do |vbox|
         vbox.customize ["modifyvm", :id, "--memory", "1024"]
      end
      dev_chef.vm.provision "shell", path: "dev_provision.sh"
    end


    # VM2
    config.vm.define :node do |node_chef|
      node_chef.vm.host_name = "node-chef"
      node_chef.vm.network "private_network", ip:"192.168.100.102"
      node_chef.vm.provider :virtualbox do |vbox|
        vbox.customize ["modifyvm", :id, "--memory", "1024"]
      end  
      node_chef.vm.provision "shell", path: "node_provision.sh"
    end
end