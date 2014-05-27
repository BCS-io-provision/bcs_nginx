#
# Kibana is a website to visulize information collected by
# logstash.
#
if node['nginx']['kibana_available']
  template '/etc/nginx/sites-available/kibana' do
    owner  'root'
    group  'root'
    mode   '0644'
    source 'kibana_virtual_server.erb'
    notifies :reload, 'service[nginx]'
  end

  nginx_site 'kibana' do
    enable true
  end
end