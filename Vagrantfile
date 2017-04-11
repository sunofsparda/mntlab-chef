# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "sbeliakou/centos-6.8-x86_64"
    
    # VM1
    config.vm.define :node1 do |node_chef|
      node_chef.vm.host_name = "chef-node1"
      node_chef.vm.network "private_network", ip:"192.168.100.201"
      node_chef.vm.provider :virtualbox do |vbox|
        vbox.customize ["modifyvm", :id, "--memory", "512"]
      end  
    end

    # VM2
    config.vm.define :node2 do |node_chef|
      node_chef.vm.host_name = "chef-node2"
      node_chef.vm.network "private_network", ip:"192.168.100.202"
      node_chef.vm.provider :virtualbox do |vbox|
        vbox.customize ["modifyvm", :id, "--memory", "512"]
      end  
    end

end