#!/bin/bash

# wget https://packages.chef.io/files/stable/chef/12.19.36/el/6/chef-12.19.36-1.el6.x86_64.rpm
# wget https://packages.chef.io/files/stable/chefdk/1.2.22/el/6/chefdk-1.2.22-1.el6.x86_64.rpm
yum localinstall -y /vagrant/soft/chef*

mkdir -p ~/{.chef,chef_cookbooks}
cat <<EOF > ~/.chef/solo.rb
log_level :debug
file_cache_path "/root/.chef/"
cookbook_path "/root/cookbooks"
json_attribs "/root/.chef/runlist.json"
EOF

cp /vagrant/env/chef/runlist.json ~/.chef/runlist.json

echo 'exit 0'
