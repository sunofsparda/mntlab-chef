#
# Cookbook:: jboss7
# Recipe:: install
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
  action :create_if_missing
end

tar_extract node['jboss7']['jboss_tar'] do
  action :extract_local
  target_dir node['jboss7']['jboss_home']
  tar_flags [ '-P', '--strip-components 1' ]
  user node['jboss7']['jboss_user']
  group node['jboss7']['jboss_group']
  creates node['jboss7']['jboss_check']
end