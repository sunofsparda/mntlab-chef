# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "sbeliakou/centos-6.8-x86_64"
    config.vm.define :node do |chef_node|
      chef_node.vm.host_name = "node-chef"
      chef_node.vm.network "forwarded_port", guest: 8080, host: 8080
      # chef_node.vm.network "private_network", ip:"192.168.100.102"
      chef_node.vm.provider :virtualbox do |vbox|
        vbox.customize ["modifyvm", :id, "--memory", "1024"]
      end  
      chef_node.vm.provision "shell", path: "node_provision.sh"
    end
end