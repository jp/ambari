require 'spec_helper'

describe 'ambari::default' do
  context 'on CentOS' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.6).converge(described_recipe)
    end

    it 'does nothing' do
      expect(chef_run).not_to run_ruby_block('remove 127.0.1.1 /etc/hosts')
    end
  end

  context 'on Ubuntu' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: 12.04).converge(described_recipe)
    end

    it 'removes 127.0.1.1 from /etc/hosts' do
      expect(chef_run).to run_ruby_block('remove 127.0.1.1 /etc/hosts')
    end
  end
end
