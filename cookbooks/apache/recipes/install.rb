#
# Cookbook:: apache
# Recipe:: install
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'httpd' do
  action :install
end

service 'httpd' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end