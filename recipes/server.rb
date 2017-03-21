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

# This could probably be a bit more clean instead of having a nested case.
# it works now, but will be ugly if we add support for all cases.
case node['ambari']['database']['type']
when 'embedded'
  db_opts = ''
when 'mysql'
  db_opts = "--database=#{node['ambari']['database']['type']} \
    --databaseport=#{node['ambari']['database']['port']} \
    --databasehost=#{node['ambari']['database']['host']} \
    --databasename=#{node['ambari']['database']['name']} \
    --databaseusername=#{node['ambari']['database']['username']} \
    --databasepassword=#{node['ambari']['database']['password']}"
when 'mssql', 'oracle', 'postgres', 'sqlanywhere'
  # needs db_opts cause the options differ from each db type.
  raise "#{node['ambari']['database']['type']} is not supported yet"
end

# this case sets the jdbc driver package name for each distro and DB type (unless database type is 'embedded').
unless node['ambari']['database']['type'] == 'embedded'
  case node['platform']
  when 'ubuntu', 'debian'
    jdbcpkg = 'libmysql-java' if node['ambari']['database']['type'] == 'mysql'
  when 'redhat', 'centos', 'amazon', 'scientific'
    jdbcpkg = 'mysql-connector-java' if node['ambari']['database']['type'] == 'mysql'
  when 'suse'
    jdbcpkg = 'mysql-connector-java' if node['ambari']['database']['type'] == 'mysql'
  end
end

# install jdbc driver.
unless node['ambari']['database']['type'] == 'embedded'
  if node['ambari']['jdbc']['url'] == ''
    package jdbcpkg
  else
    remote_file node['ambari']['jdbc']['path'] do
      source node['ambari']['jdbc']['url']
      not_if { ::File.exist?(node['ambari']['jdbc']['path']) }
    end
  end
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
