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

# deploy hudson.war
remote_file "#{node['jboss7']['jboss_deploy']}/#{node['jboss7']['test_app']}.war" do
  source "file://#{node['jboss7']['temp']}/#{node['jboss7']['test_app']}/#{node['jboss7']['test_app']}.war"
  owner 'root'
  group node['jboss7']['jboss_group']
  action :create_if_missing
  # notifies :restart, 'service[jboss7]', :delayed
end

hudson_databag = data_bag_item('newbag', 'hudson')

# replcae original hudson.xml
template "#{node['jboss7']['jboss_deploy']}/hudson.xml" do
  source 'hudson.xml'
  owner node['jboss7']['jboss_user']
  group node['jboss7']['jboss_group']
  variables({
    engine: hudson_databag['engine'],
  })
  # notifies :restart, 'service[jboss7]', :delayed
end