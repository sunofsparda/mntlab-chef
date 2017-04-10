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

bash 'deploy application' do
  # code <<-EOF
  #    unzip #{node['jboss7']['test_app_archive']} -d #{node['jboss7']['jboss_deployments']}
  # EOF
  command "unzip #{node['jboss7']['test_app_archive']} -d #{node['jboss7']['jboss_deployments']}"
  user node['jboss7']['jboss_user']
  creates "#{node['jboss7']['test_app_check']}"
  # not_if { ::File.directory? ("#{node['jboss7']['test_app_check']}")}
  notifies :restart, 'service[jboss7]', :immediately
end 