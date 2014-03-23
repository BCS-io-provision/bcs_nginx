require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'bcs_nginx::default' do
  # Seem to have a general bug in verify
  # kitchen setup fine but verify fails
end