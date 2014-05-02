
default['nginx']['default_site_enabled'] = false

# Monit_virtual_server recipe
# HTTPD through Nginx allowing userfriendly monit.<server> address
default['monit_address'] = 'monit.islay'
default['monit_port'] = '2812'
