require 'spec_helper'

describe 'ambari::server' do
  context 'on CentOS' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.6) do
        stub_command(/update-alternatives --display /).and_return(false)
      end.converge(described_recipe)
    end

    it 'installs ambari-server package' do
      expect(chef_run).to install_package('ambari-server')
    end
  end
end
#  execute[setup ambari-server]       ambari/recipes/server.rb:66
#  service[postgresql]                ambari/recipes/server.rb:72
#  service[ambari-server]             ambari/recipes/server.rb:82
