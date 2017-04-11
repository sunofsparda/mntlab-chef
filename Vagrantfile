# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "sbeliakou/centos-6.8-x86_64"

    # VM0
    config.vm.define :svr do |svr_chef|
      svr_chef.vm.host_name = "chef-server"
      svr_chef.vm.network "private_network", ip:"192.168.100.200"
      svr_chef.vm.provider :virtualbox do |vbox|
         vbox.customize ["modifyvm", :id, "--memory", "684"]
      end
      # svr_chef.vm.provision "shell", path: "dev_provision.sh"
      svr_chef.vm.provision "shell", inline: <<-SHELL
        echo "192.168.100.200 chef-server" >> /etc/hosts
        echo "192.168.100.201 chef-node1" >> /etc/hosts
        echo "192.168.100.202 chef-node2" >> /etc/hosts
        yum -y localinstall /vagrant/soft/chef-server-core-12.14.0-1.el6.x86_64.rpm
      SHELL
      svr_chef.vm.provision "shell", path: "chef-server_provision.sh"
    end
    
    # VM1
    config.vm.define :node1 do |node_chef|
      node_chef.vm.host_name = "chef-node1"
      node_chef.vm.network "private_network", ip:"192.168.100.201"
      node_chef.vm.provider :virtualbox do |vbox|
        vbox.customize ["modifyvm", :id, "--memory", "512"]
      end 
      node_chef.vm.provision "shell", inline: <<-SHELL
        echo "192.168.100.200 chef-server" >> /etc/hosts
        echo "192.168.100.201 chef-node1" >> /etc/hosts
        echo "192.168.100.202 chef-node2" >> /etc/hosts
      SHELL

    end

    # VM2
    config.vm.define :node2 do |node_chef|
      node_chef.vm.host_name = "chef-node2"
      node_chef.vm.network "private_network", ip:"192.168.100.202"
      node_chef.vm.provider :virtualbox do |vbox|
        vbox.customize ["modifyvm", :id, "--memory", "512"]
      end  
      node_chef.vm.provision "shell", inline: <<-SHELL
        echo "192.168.100.200 chef-server" >> /etc/hosts
        echo "192.168.100.201 chef-node1" >> /etc/hosts
        echo "192.168.100.202 chef-node2" >> /etc/hosts
      SHELL
    end

end