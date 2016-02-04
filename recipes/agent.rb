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

include_recipe 'ambari::default'
include_recipe 'ambari::setup_package_manager'

package 'ambari-agent'

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
  not_if 'update-alternatives --display ambari-agent-conf |grep "/etc/ambari-agent/conf.chef"'
end

# Get ambari-server fqdn
if Chef::Config[:solo]
  errmsg = 'This recipe uses search, Chef Solo does not support search.'
  Chef::Log.warn(errmsg)
elseif tagged?('ambari')
  ambari_server_fqdn = node['fqdn']
else
  ambari_server_fqdn = search('node', "tags:ambari AND chef_environment:#{node.chef_environment}").first['fqdn']
end

template '/etc/ambari-agent/conf/ambari-agent.ini' do
  source 'ambari-agent.ini.erb'
  mode 0755
  user 'root'
  group 'root'
  variables(ambari_server_fqdn: ambari_server_fqdn)
end

service 'ambari-agent' do
  supports :status => true, :restart => true, :reload => false
  action [:enable, :start]
end
