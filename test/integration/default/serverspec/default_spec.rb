require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'bcs_nginx::default' do
  it 'installed nginx version' do
    expect(package 'nginx').to be_installed
  end
end