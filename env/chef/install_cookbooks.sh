#!/bin/bash


cd /root/chef_cookbooks/chef_nginx
berks install
berks package
tar -xf cookbooks-*.tar.gz -C /root/
cd /root/chef_cookbooks/firewall
berks install
berks package
tar -xf cookbooks-*.tar.gz -C /root/
# cd /root/chef_cookbooks/iptables
# berks install
# berks package

