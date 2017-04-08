#!/bin/bash

echo '========== CLEAN_ENV =========='
echo 'Cleaning'
rm /root/.chef/* -rf
rm /root/cookbooks/* -rf
rm /root/chef_cookbooks/* -rf

# echo '=============== INIT ==============='
# echo 'Preparing environment'
# yum install -y git

echo '============= INIT_CHEF ============='
echo 'Installing Chef and ChefDK'
yum localinstall -y /vagrant/soft/chef*el6*.rpm

echo 'Init Chef home'
mkdir -p /root/chef_cookbooks

# echo '=========== GET_COOKBOOKS ==========='
# echo 'Downloading cookbooks'
# git clone https://github.com/agileorbit-cookbooks/java.git /root/chef_cookbooks/java 
# git clone https://github.com/dhoer/chef-java_se.git /root/chef_cookbooks/chef-java_se
# git clone https://github.com/chef-cookbooks/tar.git /root/chef_cookbooks/tar
# # git clone https://github.com/chef-cookbooks/chef_nginx.git /root/chef_cookbooks/chef_nginx
# # git clone https://github.com/chef-cookbooks/firewall.git /root/chef_cookbooks/firewall
# # git clone https://github.com/chef-cookbooks/iptables.git /root/chef_cookbooks/iptables

# # echo '=========== GENERATE_COOKBOOKS ==========='
# # echo 'Generating cookbooks'
# # cd /root/chef_cookbooks
# # chef generate cookbook jboss7


# echo '========= INSTALL_COOKBOOKS ========='
# echo 'Installing cookbooks'
# cd /root/chef_cookbooks/chef-java_se
# berks install
# berks package
# tar -xf cookbooks-*.tar.gz -C /root/
# rm cookbooks-*tar.gz

# echo 'Installing cookbooks'
# cd /root/chef_cookbooks/java
# berks install
# berks package
# tar -xf cookbooks-*.tar.gz -C /root/
# rm cookbooks-*tar.gz

# # cd /root/chef_cookbooks/chef_nginx
# # berks install
# # berks package
# # tar -xf cookbooks-*.tar.gz -C /root/
# # rm cookbooks-*tar.gz

# # cd /root/chef_cookbooks/firewall
# # berks install
# # berks package
# # tar -xf cookbooks-*.tar.gz -C /root/
# # rm cookbooks-*tar.gz

# # cd /root/chef_cookbooks/iptables
# # berks install
# # berks package
# # tar -xf cookbooks-*.tar.gz -C /root/
# # rm cookbooks-*tar.gz

# cd /root/chef_cookbooks/tar
# berks install
# berks package
# tar -xf cookbooks-*.tar.gz -C /root/
# rm cookbooks-*tar.gz

echo '=========== GET_EXISTING_COOKBOOKS ==========='
cp -r /vagrant/.chef /root/
cp -r /vagrant/cookbooks /root/

chef-solo -c /root/.chef/solo.rb > /vagrant/output.log

echo 'exit 0'