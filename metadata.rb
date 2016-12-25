name             'bcs_nginx'
maintainer       'BCS-io'
maintainer_email 'richard.wigley@gmail.com'
license          ''
description      'Installs/Configures nginx for bcs systems.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.0'

source_url       'https://github.com/BCS-io-provision/bcs_nginx'
issues_url       'https://github.com/BCS-io-provision/bcs_nginx/issues'

supports 'ubuntu', '>= 14.04'

%w(apt chef_nginx).each do |cb|
  depends cb
end
