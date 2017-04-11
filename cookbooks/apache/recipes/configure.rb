#
# Cookbook:: apache
# Recipe:: configure
#
# Copyright:: 2017, The Authors, All Rights Reserved.

template '/etc/httpd/conf.d/vhost.conf' do
  source 'vhost.erb'
  mode '0644'
  notifies :restart, 'service[httpd]', :immediately
end

remote_file node['tomcat']['test_app_archive'] do
  source node['tomcat']['test_app_url']
  owner node['tomcat']['tomcat_user']
  group node['tomcat']['tomcat_group']
  action :create_if_missing
end

template '/var/www/html/maintenance_page.html' do
  source 'maintenance_page.erb'
  mode '0644'
  action :create_if_missing
end