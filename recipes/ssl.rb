#
# Cookbook Name:: bcs_nginx
# Recipe:: default
#
# Copyright 2014, BCS-io
#
include_recipe 'acme'

domains                         = node['bcs_nginx']['domains']
node.default['acme']['contact'] = node['bcs_nginx']['ssl_contact']

ssl_directory = '/etc/ssl'

directory ssl_directory do
  owner 'root'
  group 'root'
  recursive true
end

Chef::Log.info("**** contact:  #{node['acme']['contact']} ******")
Chef::Log.info("**** endpoint: #{node['acme']['endpoint']} ******")
Chef::Log.info("**** renew     #{node['acme']['renew']} ******")
Chef::Log.info("**** priv:     #{node['acme']['private_key']} ******")
Chef::Log.info("**** domains:  #{node['bcs_nginx']['domains']} ******")
Chef::Log.info("**** sites:    #{node['nginx']['dir']}/sites-enabled/#{domains[0]}")

domains.each do |domain|
  # Generate a self-signed if we don't have a cert to prevent bootstrap problems
  acme_selfsigned domain do
    crt     "#{ssl_directory}/certs/#{domain}.crt"
    key     "#{ssl_directory}/private/#{domain}.key"
    notifies :restart, 'service[nginx]', :immediate
    owner    'root'
    group    'root'
    only_if { File.exist?("#{node['nginx']['dir']}/sites-enabled/#{domain}") &&
              !File.exist?("/etc/ssl/certs/#{domain}.crt") }
  end
end

include_recipe 'bcs_nginx::default'

# Set up your webserver here...

domains.each do |domain|
  # Get and auto-renew the certificate from Let's Encrypt
  acme_certificate domain do
    crt       "#{ssl_directory}/certs/#{domain}.crt"
    chain     "#{ssl_directory}/certs/#{domain}.pem"
    key       "#{ssl_directory}/private/#{domain}.key"
    retries   0
    wwwroot   node['nginx']['default_root']
    notifies  :restart, 'service[nginx]'
    alt_names ["www.#{domain}"]
    only_if { File.exist?("#{node['nginx']['dir']}/sites-enabled/#{domain}") }
  end
end
