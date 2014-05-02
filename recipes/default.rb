#
# Cookbook Name:: bcs_nginx
# Recipe:: default
#
# Copyright 2014, BCS-io
#
include_recipe "nginx::default"

service 'nginx' do
  supports :restart => true, :reload => true
  action :restart
end