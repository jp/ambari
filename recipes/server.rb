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

%w(ambari-server postgresql).each do |pack|
  package pack
end

execute 'setup ambari-server' do
  command 'ambari-server setup -s'
end

service 'postgresql' do
  action [:enable, :start]
end

service 'ambari-server' do
  status_command "/etc/init.d/ambari-server status | grep 'Ambari Server running'"
  action [:enable, :start]
end
