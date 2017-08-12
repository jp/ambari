require 'spec_helper'

describe 'ambari::agent' do
  context 'on CentOS' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.6) do
        stub_command(/update-alternatives --display /).and_return(false)
      end.converge(described_recipe)
    end

    it 'installs ambari-agent package' do
      expect(chef_run).to install_package('ambari-agent')
    end

    it 'creates conf.chef directory' do
      expect(chef_run).to create_directory('/etc/ambari-agent/conf.chef')
    end
  end
end
#  execute[move existing ambari configuration]   ambari/recipes/agent.rb:32
#  execute[alternatives configured confdir]   ambari/recipes/agent.rb:39
#  template[/etc/ambari-agent/conf/ambari-agent.ini]   ambari/recipes/agent.rb:72
#  service[ambari-agent]              ambari/recipes/agent.rb:80
