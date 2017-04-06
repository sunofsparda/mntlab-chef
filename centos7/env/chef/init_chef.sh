#!/bin/bash

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
