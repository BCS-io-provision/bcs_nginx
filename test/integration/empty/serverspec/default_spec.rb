require 'serverspec'
set :backend, :exec

describe 'bcs_nginx::default' do
  describe 'monit site' do
    describe file '/etc/nginx/sites-available/monit' do
      it { should_not be_file }
    end

    describe file '/etc/nginx/sites-enabled/monit' do
      it { should_not be_file }
    end
  end

  describe 'kibana site' do
    describe file '/etc/nginx/sites-available/kibana' do
      it { should_not be_file }
    end

    describe file '/etc/nginx/sites-enabled/kibana' do
      it { should_not be_file }
    end
  end
end