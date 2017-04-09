# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "sbeliakou/centos-6.8-x86_64"
    
    # VM1
    config.vm.define :dev do |vm1_config|
      vm1_config.vm.host_name = "dev-chef"
      vm1_config.vm.network "private_network", ip:"192.168.100.101"
      vm1_config.vm.provider :virtualbox do |vbox|
         vbox.customize ["modifyvm", :id, "--memory", "512"]
      end
      vm1_config.vm.provision "shell", path: "dev_provision.sh"
    end

    # VM2
    config.vm.define :node do |vm2_config|
      vm2_config.vm.host_name = "node-chef"
      vm2_config.vm.network "private_network", ip:"192.168.100.102"
      vm2_config.vm.provider :virtualbox do |vbox|
        vbox.customize ["modifyvm", :id, "--memory", "1024"]
      end  
      vm2_config.vm.provision "shell", path: "node_provision.sh"
    end
end