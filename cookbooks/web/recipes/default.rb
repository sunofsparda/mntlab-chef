#
# Cookbook:: web
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node[:web][:web_server_type] == "nginx"
  web 'install nginx' do
  action [ :install, :enable, :start ]
  provider Chef::Provider::WebNginx
  end

elsif node[:web][:web_server_type] == "apache"
  web 'install apache' do
  action [ :install, :enable, :start ]
  provider Chef::Provider::WebApache
  end

else
  puts "ERROR"
end
