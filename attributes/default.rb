#
# Cookbook Name:: ambari
# Attributes:: default
#

# default['ambari']['server_fqdn'] = 'localhost'

# Set default version to Ambari 2.0
default['ambari']['version'] = '2.0'

case node['ambari']['version']
when '1.7'
  default['ambari']['rhel_5_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos5/1.x/updates/1.7.0/ambari.repo'
  default['ambari']['rhel_6_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.7.0/ambari.repo'
  default['ambari']['suse_11_repo'] = 'http://public-repo-1.hortonworks.com/ambari/suse11/1.x/updates/1.7.0/ambari.repo'
  default['ambari']['ubuntu_12_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu12/1.x/updates/1.7.0'
when '2.0', '2'
  default['ambari']['rhel_5_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos5/2.x/updates/2.0.0/ambari.repo'
  default['ambari']['rhel_6_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.0.0/ambari.repo'
  default['ambari']['suse_11_repo'] = 'http://public-repo-1.hortonworks.com/ambari/suse11/2.x/updates/2.0.0/ambari.repo'
  default['ambari']['ubuntu_12_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.0.0'
when '2.0.1'
  default['ambari']['rhel_5_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos5/2.x/updates/2.0.1/ambari.repo'
  default['ambari']['rhel_6_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.1.2/ambari.repo'
  default['ambari']['suse_11_repo'] = 'http://public-repo-1.hortonworks.com/ambari/suse11/2.x/updates/2.1.2/ambari.repo'
  default['ambari']['ubuntu_12_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.1.2/ambari.list'
end

default['ambari']['admin_user'] = 'admin'
default['ambari']['admin_password'] = 'admin'
