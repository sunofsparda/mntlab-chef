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
echo 'Installing Chef'
yum localinstall -y /vagrant/soft/chef-*el6*.rpm

echo '=========== GET_CHEF_HOME ==========='
cp -r /vagrant/.chef /root/

echo '=========== GET_EXISTING_COOKBOOKS ==========='
cp -r /vagrant/cookbooks /root/

echo '=========== RUN_CHEF ==========='
chef-solo -c /root/.chef/solo.rb > /vagrant/output.log

echo 'end of provision'
echo 'please, ensure that env is ok'
echo 'this script does not provide any checks'
