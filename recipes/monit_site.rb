#
# Monit is a website for visulizing information on the
# availablilty of applications running on systems.#
#
if node['nginx']['monit_available']
  template '/etc/nginx/sites-available/monit' do
    owner  'root'
    group  'root'
    mode   '0644'
    source 'monit_virtual_server.erb'
    variables(
      monit_address: node['nginx']['monit_address'],
      monit_port:    node['nginx']['monit_port']
    )
    notifies :reload, 'service[nginx]'
  end

  nginx_site 'monit' do
    enable true
  end
end
