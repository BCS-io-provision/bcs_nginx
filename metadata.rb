name             'nginx-wrapper'
maintainer       'BCS-io'
maintainer_email 'richard.wigley@gmail.com'
license          ''
description      'Installs/Configures nginx-wrapper'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'


supports 'ubuntu', '>= 12.04'

%w{ nginx }.each do |cb|
  depends cb
end