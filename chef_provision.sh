#!/bin/bash

chef-server-ctl reconfigure
chef-server-ctl install chef-manage
chef-server-ctl reconfigure
chef-manage-ctl reconfigure

chef-server-ctl user-create admin Chef Node1 admin@chef-server.com 'qwe123' --filename /vagrant/.chef/admin.pem
chef-server-ctl org-create acsun 'AC Sun, Inc.' --association_user admin --filename /vagrant/.chef/chef-validator.pem
