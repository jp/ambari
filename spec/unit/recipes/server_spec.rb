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

  context 'using MySQL' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.6) do |node|
        node.override['ambari']['database']['type'] = 'mysql'
        stub_command(/update-alternatives --display /).and_return(false)
      end.converge(described_recipe)
    end

    it 'installs mysql-connector-java package' do
      expect(chef_run).to install_package('mysql-connector-java')
    end
  end

  context 'on Ubuntu using MySQL' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: 12.04) do |node|
        node.override['ambari']['database']['type'] = 'mysql'
        stub_command(/update-alternatives --display /).and_return(false)
      end.converge(described_recipe)
    end

    it 'installs libmysql-java package' do
      expect(chef_run).to install_package('libmysql-java')
    end
  end
end
