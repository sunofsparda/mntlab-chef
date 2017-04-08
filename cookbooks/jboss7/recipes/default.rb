#
# Cookbook:: jboss7
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

group node['jboss7']['jboss_group'] do
  system true
end

user node['jboss7']['jboss_user'] do
  group node['jboss7']['jboss_group']
  comment 'jboss User'
  home node['jboss7']['jboss_home']
  shell '/bin/false'
  manage_home true
  system true
end

# # FIXME: WORKAROUND. Chef don't want to create home dir for jboss
# # FIXED!
# # directory node['jboss7']['jboss_home'] do
# #   owner node['jboss7']['jboss_user']
# #   group node['jboss7']['jboss_group']
# #   mode 00755
# #   action :create
# # end

remote_file node['jboss7']['jboss_tar'] do
  source node['jboss7']['dl_url']
  owner node['jboss7']['jboss_user']
  group node['jboss7']['jboss_group']
  not_if { ::File.file?("node['jboss7']['jboss_tar']") }
end

tar_extract node['jboss7']['jboss_tar'] do
  action :extract_local
  target_dir node['jboss7']['jboss_home']
  tar_flags [ '-P', '--strip-components 1' ]
  user node['jboss7']['jboss_user']
  group node['jboss7']['jboss_group']
  creates node['jboss7']['jboss_check']
end

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
  supports restart: true
  action :enable
end