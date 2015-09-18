#
# Cookbook Name:: ambari
# Recipe:: blueprints
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

if Chef::Config[:solo]
  Chef::Log.warn('This recipe uses search. Chef Solo does not support search.')
else
  ambari_server_fqdn = node['ambari']['server_fqdn'] || search('node', 'run_list:recipe\[ambari\:\:server\] AND chef_environment:' + node.chef_environment).first['fqdn']
end
basic_auth_parameters = "--user #{node['ambari']['admin_user']}:#{node['ambari']['admin_password']}"

execute 'Init Blueprints' do
  command "curl #{basic_auth_parameters} -H 'X-Requested-By:ambari-cookbook' --data '#{node['ambari']['blueprints']['blueprint_json'].to_json}' #{ambari_server_fqdn}:8080/api/v1/blueprints/#{node['ambari']['blueprints']['blueprint_name']}"
end

execute 'Init Cluster' do
  command "curl #{basic_auth_parameters} -H 'X-Requested-By:ambari-cookbook' --data '#{node['ambari']['blueprints']['cluster_json'].to_json}' #{ambari_server_fqdn}:8080/api/v1/clusters/#{node['ambari']['blueprints']['cluster_name']}"
end
