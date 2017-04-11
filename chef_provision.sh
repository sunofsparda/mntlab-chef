#!/bin/bash

chef-server-ctl reconfigure

chef-server-ctl user-create acherlyonok Chef Node1 acherlyonok@chef-server.com 'qwe123' --filename /vagrant/.chef/acherlyonok.pem
chef-server-ctl org-create acsun 'AC Sun, Inc.' --association_user acherlyonok --filename /vagrant/.chef/chef-validator.pem

chef-server-ctl install chef-manage --path /vagrant/soft/chef-manage-2.5.1-1.el6.x86_64.rpm
chef-server-ctl reconfigure
chef-manage-ctl reconfigure --accept-license
