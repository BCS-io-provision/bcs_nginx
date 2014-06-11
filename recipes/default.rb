#
# Cookbook Name:: bcs_nginx
# Recipe:: default
#
# Copyright 2014, BCS-io
#
include_recipe 'nginx::default'
include_recipe 'bcs_nginx::monit_site'
include_recipe 'bcs_nginx::kibana_site'

service 'nginx' do
  supports :restart => true, :reload => true
  action [:enable, :start]
end