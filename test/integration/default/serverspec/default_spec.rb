require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'bcs_nginx::default' do
  it 'installed nginx version' do
    expect(package 'nginx').to be_installed
  end

  describe service 'nginx' do
    it { should be_enabled }
    it { should be_running }
  end

  describe 'monit site' do
    describe file '/etc/nginx/sites-available/monit' do
      it { should be_file }
      its(:content) { should match /monit.change.this/ }
      its(:content) { should match /2812/ }
    end

    describe file '/etc/nginx/sites-enabled/monit' do
      it { should be_file }
      it { should be_linked_to '/etc/nginx/sites-available/monit' }
    end
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