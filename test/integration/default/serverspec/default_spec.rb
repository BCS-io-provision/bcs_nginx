require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'bcs_nginx::default' do
  it 'installed nginx version' do
    expect(package 'nginx').to be_installed
  end

  describe 'kibana site' do
    describe file '/etc/nginx/sites-available/kibana' do
      it { should be_file }
    end

    describe file '/etc/nginx/sites-enabled/kibana' do
      it { should be_file }
      it { should be_linked_to '/etc/nginx/sites-available/kibana' }
    end
  end
end