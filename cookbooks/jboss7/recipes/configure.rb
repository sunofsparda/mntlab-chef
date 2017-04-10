#
# Cookbook:: jboss7
# Recipe:: configure
#
# Copyright:: 2017, The Authors, All Rights Reserved.

template "#{node['jboss7']['jboss_home']}/standalone/configuration/standalone.xml" do
  source 'standalone_xml.erb'
  owner node['jboss7']['jboss_user']
  group node['jboss7']['jboss_group']
  mode '0644'
  notifies :restart, 'service[jboss7]', :delayed
end

template "#{node['jboss7']['jboss_home']}/bin/standalone.conf" do
  source 'standalone_conf.erb'
  owner node['jboss7']['jboss_user']
  group node['jboss7']['jboss_group']
  mode '0644'
  notifies :restart, 'service[jboss7]', :delayed
end

dist_dir, _conf_dir = value_for_platform_family(
  ['debian'] => %w( debian default ),
  ['rhel'] => %w( redhat sysconfig )
)

template '/etc/jboss-as.conf' do
  source "#{dist_dir}/jboss-as_conf.erb"
  mode 0775
  owner 'root'
  group node['root_group']
  only_if { platform_family?('rhel') }
  notifies :restart, 'service[jboss7]', :delayed
end

template '/etc/init.d/jboss7' do
  source "#{dist_dir}/jboss7-init.erb"
  mode 0775
  owner 'root'
  group node['root_group']
  notifies :enable, 'service[jboss7]', :delayed
  notifies :restart, 'service[jboss7]', :delayed
end

# jboss7_user node['jboss7']['admin_user'] do
#   password node['jboss7']['admin_pass']
#   action :create
#   notifies :restart, 'service[jboss7]', :delayed
# end

service 'jboss7' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end