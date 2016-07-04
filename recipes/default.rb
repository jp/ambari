#
# Cookbook Name:: ambari
# Recipe:: default
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

case node['lsb']['codename']
when 'precise', 'trusty', 'wheezy'
  ruby_block 'remove 127.0.1.1 /etc/hosts' do
    block do
      file = Chef::Util::FileEdit.new('/etc/hosts')
      file.search_file_delete_line(/^127\.0\.1\.1/)
      file.write_file
    end
  end
end
