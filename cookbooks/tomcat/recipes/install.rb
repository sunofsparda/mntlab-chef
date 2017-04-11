#
# Cookbook:: tomcat
# Recipe:: install
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'tomcat' do
  action :install
end

service 'tomcat' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end