if node[:monit_address]
  template '/etc/nginx/sites-enabled/monit' do
    owner  'root'
    group  'root'
    mode   '0644'
    source 'monit_virtual_server.erb'
  end
end