
default['nginx']['default_site_enabled'] = false

# Monit_virtual_server recipe
# HTTPD through Nginx allowing userfriendly monit.<server> address
default['nginx']['monit_available'] = false
default['nginx']['monit_address'] = 'monit.change.this'
default['nginx']['monit_port'] = '2812'


default['nginx']['kibana_available'] = false