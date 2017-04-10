#!/bin/bash

chef-server-ctl reconfigure

chef-server-ctl user-create admin admin admin admin@chef.node 'admin1' --filename /vagrant/admin.rsa
chef-server-ctl user-create user UserName UserLastName user@chef.node 'qwe123' --filename /vagrant/user.pem

