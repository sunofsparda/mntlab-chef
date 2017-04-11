#
# Cookbook:: jboss7
# Recipe:: deploy
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'unzip' do
  action :install
end

remote_file node['jboss7']['test_app_archive'] do
  source node['jboss7']['test_app_url']
  owner node['jboss7']['jboss_user']
  group node['jboss7']['jboss_group']
  action :create_if_missing
end

execute 'extract application' do
  command "unzip #{node['jboss7']['test_app_archive']} -d #{node['jboss7']['temp']}"
  user 'root'
  group node['jboss7']['jboss7_group']
  creates "#{node['jboss7']['temp']}/#{node['jboss7']['test_app']}/#{node['jboss7']['test_app']}.war"
end 

remote_file "#{node['jboss7']['jboss7_deploy']}/#{node['jboss7']['test_app']}.war" do
  source "file://#{node['jboss7']['temp']}/#{node['jboss7']['test_app']}/#{node['jboss7']['test_app']}.war"
  owner 'root'
  group node['jboss7']['jboss7_group']
  action :create_if_missing
  # notifies :restart, 'service[jboss7]', :immediately
end