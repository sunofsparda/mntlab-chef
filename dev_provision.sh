#!/bin/bash

echo '========== CLEAN_ENV =========='
echo 'Cleaning'
rm /root/.chef/* -rf
rm /root/cookbooks/* -rf
rm /root/chef_cookbooks/* -rf

echo '=============== INIT ==============='
echo 'Preparing environment'
yum install -y git

echo '============= INIT_CHEF ============='
echo 'Installing Chef and ChefDK'
yum localinstall -y /vagrant/soft/chef*el6*.rpm

echo 'Init Chef home'
mkdir -p /root/chef_cookbooks

echo '=========== GET_COOKBOOKS ==========='
echo 'Downloading cookbooks'
git clone https://github.com/agileorbit-cookbooks/java.git /root/chef_cookbooks/java 
# git clone https://github.com/dhoer/chef-java_se.git /root/chef_cookbooks/chef-java_se
git clone https://github.com/chef-cookbooks/tar.git /root/chef_cookbooks/tar
git clone https://github.com/chef-cookbooks/chef_nginx.git /root/chef_cookbooks/chef_nginx
git clone https://github.com/chef-cookbooks/firewall.git /root/chef_cookbooks/firewall
git clone https://github.com/chef-cookbooks/iptables.git /root/chef_cookbooks/iptables

echo '========= INSTALL_COOKBOOKS ========='
echo 'Installing cookbooks'

cd /root/chef_cookbooks/java
berks install
berks package
tar -xf cookbooks-*.tar.gz -C /root/
rm cookbooks-*tar.gz

cd /root/chef_cookbooks/chef_nginx
berks install
berks package
tar -xf cookbooks-*.tar.gz -C /root/
rm cookbooks-*tar.gz

cd /root/chef_cookbooks/firewall
berks install
berks package
tar -xf cookbooks-*.tar.gz -C /root/
rm cookbooks-*tar.gz

cd /root/chef_cookbooks/tar
berks install
berks package
tar -xf cookbooks-*.tar.gz -C /root/
rm cookbooks-*tar.gz

echo '=========== UPLOAD_COOKBOOKS ==========='
cp -r /root/cookbooks

echo 'exit 0'