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

package 'curl'

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
    do_search = if Chef::Config[:solo] # chef-solo can't search, by default
                  if node['recipes'].include?('chef-solo-search::default')
                    true # it can with chef-solo-search
                  else
                    false
                  end
                else
                  true
                end
    if do_search == true
      search('node', 'recipes:ambari\:\:server AND chef_environment:' + node.chef_environment).first['fqdn'] # ~FC010
    end
  end

basic_auth_parameters = "--user #{node['ambari']['admin_user']}:#{node['ambari']['admin_password']}"

file '/tmp/blueprint.json' do
  content Chef::JSONCompat.to_json_pretty(node['ambari']['blueprints']['blueprint_json'].to_hash)
end

file '/tmp/cluster.json' do
  content Chef::JSONCompat.to_json_pretty(node['ambari']['blueprints']['cluster_json'].to_hash)
end

execute 'Init Blueprints' do
  command "curl #{basic_auth_parameters} -H 'X-Requested-By:ambari-cookbook' --data @/tmp/blueprint.json #{ambari_server_fqdn}:8080/api/v1/blueprints/#{node['ambari']['blueprints']['blueprint_name']}"
end

execute 'Init Cluster' do
  command "curl #{basic_auth_parameters} -H 'X-Requested-By:ambari-cookbook' --data @/tmp/cluster.json #{ambari_server_fqdn}:8080/api/v1/clusters/#{node['ambari']['blueprints']['cluster_name']}"
end
