#
# Cookbook:: tomcat
# Recipe:: deploy
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'unzip' do
  action :install
end

remote_file node['tomcat']['test_app_archive'] do
  source node['tomcat']['test_app_url']
  owner node['tomcat']['tomcat_user']
  group node['tomcat']['tomcat_group']
  action :create_if_missing
end

execute 'deploy application' do
  command "unzip #{node['tomcat']['test_app_archive']} -d #{node['tomcat']['temp']}"
  user node['tomcat']['tomcat_user']
  group node['tomcat']['tomcat_group']
  creates "#{node['tomcat']['temp']}/#{node['tomcat']['test_app']}/#{node['tomcat']['test_app']}.war"
end 

remote_file "#{node['tomcat']['tomcat_deploy']}/#{node['tomcat']['test_app']}.war" do
  source "file://#{node['tomcat']['temp']}/#{node['tomcat']['test_app']}/#{node['tomcat']['test_app']}.war"
  user 'root'
  group node['tomcat']['tomcat_group']
  action :create_if_missing
  notifies :restart, 'service[tomcat]', :immediately
end