#!/bin/bash

yum install -y git glibc
# wget https://packages.chef.io/files/stable/chef/12.19.36/el/6/chef-12.19.36-1.el6.x86_64.rpm
# wget https://packages.chef.io/files/stable/chefdk/1.2.22/el/6/chefdk-1.2.22-1.el6.x86_64.rpm
yum localinstall -y /vagrant/soft/chef*el6*

mkdir -p ~/{.chef,chef_cookbooks}
cat <<EOF > ~/.chef/solo.rb
log_level :debug
file_cache_path "/root/.chef/"
cookbook_path "/root/cookbooks"
json_attribs "/root/.chef/runlist.json"
EOF

cp /vagrant/env/chef/runlist.json ~/.chef/runlist.json

git clone https://github.com/chef-cookbooks/chef_nginx.git /root/chef_cookbooks/chef_nginx
git clone https://github.com/chef-cookbooks/firewall.git /root/chef_cookbooks/firewall
git clone https://github.com/chef-cookbooks/iptables.git /root/chef_cookbooks/iptables

cd /root/chef_cookbooks/chef_nginx
berks install
berks package
tar -xf cookbooks-*.tar.gz -C /root/

cd /root/chef_cookbooks/firewall
berks install
berks package
tar -xf cookbooks-*.tar.gz -C /root/

cd /root/chef_cookbooks/iptables
berks install
berks package
tar -xf cookbooks-*.tar.gz -C /root/

echo 'exit 0'
