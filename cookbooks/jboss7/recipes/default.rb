#
# Cookbook:: jboss7
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


include_recipe 'java'
include_recipe "jboss7::install"
include_recipe "jboss7::configure"
include_recipe "jboss7::deploy"