#
# Cookbook Name:: bcs_nginx
# Recipe:: default
#
# Copyright 2014, BCS-io
#
include_recipe 'chef_nginx::default'
include_recipe 'chef_nginx::http_ssl_module'
include_recipe 'bcs_nginx::monit_site'
include_recipe 'bcs_nginx::kibana_site'
