#!/bin/bash

# chef-server-ctl reconfigure
chef-server-ctl install chef-manage
chef-server-ctl reconfigure
chef-manage-ctl reconfigure

chef-server-ctl user-create node1 Chef Node1 node1@chef.node 'qwe123' --filename /vagrant/.chef/chef-node1.pem
# chef-server-ctl user-create user2 Chef Node1 user@chef.node 'qwe123' --filename /vagrant/chef-node1.pem
chef-server-ctl org-create acsun 'AC Sun, Inc.' --association_user node1 --filename /vagrant/.chef/chef-validator.pem

knife bootstrap 192.168.100.102 -x root -P 'vagrant' -N TEST_NODE -E chef-server -r 'jboss'
