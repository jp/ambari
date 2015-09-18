#
# Cookbook Name:: ambari
# Recipe:: agent
#
# Copyright 2014, JULIEN PELLET
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'ambari::setup_package_manager'

%w(ambari-agent).each do |pack|
  package pack do
    action :install
  end
end

directory '/etc/ambari-agent/conf.chef' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'move existing ambari configuration' do
  command 'mv /etc/ambari-agent/conf /etc/ambari-agent/conf.dist'
  only_if do
    !::File.exist?('/etc/ambari-agent/conf.dist')
  end
end

execute 'alternatives configured confdir' do
  command 'update-alternatives --install /etc/ambari-agent/conf ambari-agent-conf /etc/ambari-agent/conf.chef 90'
end

# Get Ambari Server FQDN
#
# Logic:
# - is server set?
# - am I server?
# - must search
#   - can I search?
#   - search
ambari_server_fqdn =
  if node['ambari'].key?('server_fqdn') # Server is set
    node['ambari']['server_fqdn']
  elsif node['recipes'].include?('ambari::server') # Server is me
    node['fqdn']
  else # must search
    if Chef::Config[:solo] # chef-solo can't search, by default
      if node['recipes'].include?('chef-solo-search::default')
        do_search = true # it can with chef-solo-search
      else
        do_search = false
      end
    else
      do_search = true
    end
    if do_search == true
      search('node', 'recipes:ambari\:\:server AND chef_environment:' + node.chef_environment).first['fqdn']
    end
  end

template '/etc/ambari-agent/conf/ambari-agent.ini' do
  source 'ambari-agent.ini.erb'
  mode 0755
  user 'root'
  group 'root'
  variables(ambari_server_fqdn: ambari_server_fqdn)
end

service 'ambari-agent' do
  action [:enable, :start]
end

service 'iptables' do
  action [:disable, :stop]
end
