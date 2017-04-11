#!/bin/bash

echo '========== CLEAN_ENV =========='
rm /root/.chef/* -rf
rm /root/cookbooks/* -rf
rm /root/chef_cookbooks/* -rf

echo '============= INIT_CHEF ============='
yum localinstall -y /vagrant/soft/chefdk-*el6*.rpm > /dev/null 2>&1

echo '=========== GET_CHEF_HOME ==========='
cp -r /vagrant/.chef /root/

echo '=========== GET_EXISTING_COOKBOOKS ==========='
cp -r /vagrant/cookbooks /root/

echo '=========== RUN_CHEF ==========='
chef-solo -c /root/.chef/solo.rb > /vagrant/report/output.log
chef-solo -c /root/.chef/solo.rb >> /vagrant/report/output.log
echo 'end of provision'
echo 'please, ensure that env is ok'
echo 'this script does not provide any checks'