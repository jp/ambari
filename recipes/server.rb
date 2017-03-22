#
# Cookbook Name:: ambari
# Recipe:: server
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

package 'ambari-server'

db_opts = ''
# Unfortunately, we only support embedded or mysql at this time
case node['ambari']['database']['type']
when 'mysql'
  db_opts += "--database=#{node['ambari']['database']['type']}"
  db_opts += " --databaseport=#{node['ambari']['database']['port']}"
  db_opts += " --databasehost=#{node['ambari']['database']['host']}"
  db_opts += " --databasename=#{node['ambari']['database']['name']}"
  db_opts += " --databaseusername=#{node['ambari']['database']['username']}"
  db_opts += " --databasepassword=#{node['ambari']['database']['password']}"
  db_opts += " --jdbc-db=#{node['ambari']['database']['type']}"
  db_opts += " --jdbc-driver=#{node['ambari']['jdbc']['path']}"
  jdbcpkg =
    if node['platform_family'] == 'debian'
      'libmysql-java'
    else
      'mysql-connector-java'
    end
  # Install JDBC driver
  if node['ambari']['jdbc']['url'].empty? || node['ambari']['jdbc']['url'].nil?
    package jdbcpkg
  else
    remote_file node['ambari']['jdbc']['path'] do
      source node['ambari']['jdbc']['url']
      not_if { ::File.exist?(node['ambari']['jdbc']['path']) }
    end
  end

when 'mssql', 'oracle', 'postgres', 'sqlanywhere'
  # needs db_opts cause the options differ from each db type.
  raise "#{node['ambari']['database']['type']} is not supported yet"
end

execute 'setup ambari-server' do
  command "ambari-server setup #{db_opts} -s && touch /etc/ambari-server/.configured"
  creates '/etc/ambari-server/.configured'
end

if node['ambari']['database']['type'] == 'embedded'
  service 'postgresql' do
    supports :status => true, :restart => true, :reload => true
    action [:enable, :start]
  end
else
  service 'postgresql' do
    action [:disable, :stop]
  end
end

service 'ambari-server' do
  status_command 'service ambari-server status'
  supports :status => true, :restart => true, :reload => false
  action [:start, :enable]
end
