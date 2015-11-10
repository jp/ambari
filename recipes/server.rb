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

include_recipe 'ambari::setup_package_manager'

package 'ambari-server'

case node['ambari']['jdbc-db']
when 'mysql'
  case node['platform']
  when 'ubuntu', 'debian'
    package 'libmysql-java'
  when 'redhat', 'centos', 'amazon', 'scientific'
    Chef::Log.warn('not fixed yet')
  when 'suse'
    Chef::Log.warn('not fixed yet')
  end
when 'mssql'
  Chef::Log.warn('not fixed yet')
when 'oracle'
  Chef::Log.warn('not fixed yet')
when 'hsqldb'
  Chef::Log.warn('not fixed yet')
when 'sqlanywhere'
  Chef::Log.warn('not fixed yet')
end

if node['ambari']['jdbc-db'] == 'default'
  db_opts = ''
else
  db_opts = "--jdbc-db=#{node['ambari']['jdbc-db']} \
--jdbc-driver=#{node['ambari']['jdbc-driver']} \
--database=#{node['ambari']['database']} \
--databaseport=#{node['ambari']['databaseport']} \
--databasehost=#{node['ambari']['databasehost']} \
--databasename=#{node['ambari']['databasename']} \
--databaseusername=#{node['ambari']['databaseusername']} \
--databasepassword=#{node['ambari']['databasepassword']}"
end

execute 'setup ambari-server' do
  command "ambari-server setup #{db_opts} -s && touch /etc/ambari-server/.configured"
  creates '/etc/ambari-server/.configured'
end
  
if node['ambari']['jdbc-db'] == 'default'
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
  supports :status => true, :restart => true, :reload => false
  action [:start, :enable]
end

tag('ambari')
