name             'bcs_nginx'
maintainer       'BCS-io'
maintainer_email 'richard.wigley@gmail.com'
license          ''
description      'Installs/Configures nginx for bcs systems.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'


supports 'ubuntu', '>= 12.04'

%w{ nginx }.each do |cb|
  depends cb
end