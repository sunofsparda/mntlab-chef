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

bash 'deploy application' do
  code <<-EOF
    unzip #{node['tomcat']['test_app_archive']} -d #{node['tomcat']['temp']}
    mv #{node['tomcat']['temp']}/#{node['tomcat']['test_app']}/* #{node['tomcat']['tomcat_deploy']}/
    rm -rf #{node['tomcat']['temp']}/#{node['tomcat']['test_app']}
  EOF
  user 'root'
  group node['tomcat']['tomcat_group']
  creates "#{node['tomcat']['test_app_check']}"
  notifies :restart, 'service[tomcat]', :immediately
end 

# remote_file "#{node['tomcat']['tomcat_deploy']}/#{node['tomcat']['test_app']}.war"
#   source "#{node['tomcat']['temp']}/#{node['tomcat']['test_app']}.war/"
#   user 'root'
#   group node['tomcat']['tomcat_group']
#   creates "#{node['tomcat']['test_app_check']}"
#   notifies :restart, 'service[tomcat]', :immediately
# end