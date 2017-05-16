
default['nginx']['default_site_enabled'] = false

# Monit_virtual_server recipe
# HTTPD through Nginx allowing userfriendly monit.<server> address
default['nginx']['monit_available'] = false
default['nginx']['monit_address'] = 'monit.change.this'
default['nginx']['monit_port'] = '2812'

default['nginx']['kibana_available'] = false

# Set up contact information. Note the mailto: notation
default['bcs_nginx']['ssl_contact'] = ['mailto:mail@shade.lighting']
default['bcs_nginx']['domains'] = ['draca.co.uk', 'shade.lighting', 'book-gardener.co.uk']

# Fake certificates for testing
# If you change endpoints you should also delete private_key
# default['acme']['endpoint'] = 'https://acme-staging.api.letsencrypt.org'

# delete private_key if switching between endpoints
# private_key used to identify with endpoint and are not shared between
# PublicKeyInfrastructure (PKI). When I switched from staging to production
# endpoint it failed to authenticate until I deleted the key
# node.rm('acme', 'private_key')
