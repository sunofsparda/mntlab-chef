#
# Cookbook:: apache
# Recipe:: disable_maintenance_mode
#
# Copyright:: 2017, The Authors, All Rights Reserved.

template '/etc/httpd/conf.d/vhost.conf' do
  source 'prod_vhost.erb'
  mode '0644'
  # notifies :restart, 'service[httpd]', :immediately
end

service 'httpd' do
  action :restart
end
