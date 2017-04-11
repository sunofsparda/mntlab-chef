#
# Cookbook:: apache
# Recipe:: enable_maintenance_mode
#
# Copyright:: 2017, The Authors, All Rights Reserved.

template '/var/www/html/maintenance_page.html' do
  source 'maintenance_page.erb'
  mode '0644'
  # action :create_if_missing
end

template '/etc/httpd/conf.d/vhost.conf' do
  source 'maintenance_vhost.erb'
  mode '0644'
  # notifies :restart, 'service[httpd]', :immediately
end
