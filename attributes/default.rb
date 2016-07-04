#
# Cookbook Name:: ambari
# Attributes:: default
#

# Set default version of Ambari if one is not supplied.
node.default['ambari']['version'] = '2.2.0'

case node['ambari']['version']
when '1.7'
  node.default['ambari']['rhel_5_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos5/1.x/updates/1.7.0/ambari.repo'
  node.default['ambari']['rhel_6_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.7.0/ambari.repo'
  node.default['ambari']['suse_11_repo'] = 'http://public-repo-1.hortonworks.com/ambari/suse11/1.x/updates/1.7.0/ambari.repo'
  node.default['ambari']['ubuntu_12_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu12/1.x/updates/1.7.0'
when '2', '2.0'
  node.default['ambari']['rhel_5_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos5/2.x/updates/2.0.0/ambari.repo'
  node.default['ambari']['rhel_6_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.0.0/ambari.repo'
  node.default['ambari']['suse_11_repo'] = 'http://public-repo-1.hortonworks.com/ambari/suse11/2.x/updates/2.0.0/ambari.repo'
  node.default['ambari']['ubuntu_12_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.0.0'
when '2.0.1'
  node.default['ambari']['rhel_5_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos5/2.x/updates/2.0.1/ambari.repo'
  node.default['ambari']['rhel_6_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.0.1/ambari.repo'
  node.default['ambari']['suse_11_repo'] = 'http://public-repo-1.hortonworks.com/ambari/suse11/2.x/updates/2.0.1/ambari.repo'
  node.default['ambari']['ubuntu_12_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.0.1'
when '2.1'
  # RHEL 5 no longer supported in Ambari 2.1
  node.default['ambari']['rhel_6_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.1.2/ambari.repo'
  node.default['ambari']['rhel_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.1.2/ambari.repo'
  node.default['ambari']['suse_11_repo'] = 'http://public-repo-1.hortonworks.com/ambari/suse11/2.x/updates/2.1.2/ambari.repo'
  node.default['ambari']['ubuntu_12_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.1.2.1'
  node.default['ambari']['ubuntu_14_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu14/2.x/updates/2.1.2.1'
  node.default['ambari']['debian_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/debian7/2.x/updates/2.1.2/ambari.list'
when '2.2', '2.2.0'
  node.default['ambari']['rhel_6_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.2.0.0/ambari.repo'
  node.default['ambari']['rhel_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.2.0.0/ambari.repo'
  node.default['ambari']['suse_11_repo'] = 'http://public-repo-1.hortonworks.com/ambari/suse11/2.x/updates/2.2.0.0/ambari.repo'
  node.default['ambari']['ubuntu_12_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.2.0.0'
  node.default['ambari']['ubuntu_14_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu14/2.x/updates/2.2.0.0'
  node.default['ambari']['debian_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/debian7/2.x/updates/2.2.0.0/ambari.list'
when '2.2.1'
  node.default['ambari']['rhel_6_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.2.1.1/ambari.repo'
  node.default['ambari']['rhel_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.2.1.1/ambari.repo'
  node.default['ambari']['suse_11_repo'] = 'http://public-repo-1.hortonworks.com/ambari/suse11/2.x/updates/2.2.1.1/ambari.repo'
  node.default['ambari']['ubuntu_12_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.2.1.1'
  node.default['ambari']['ubuntu_14_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu14/2.x/updates/2.2.1.1'
  node.default['ambari']['debian_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/debian7/2.x/updates/2.2.1.1/ambari.list'
end

node.default['ambari']['admin_user'] = 'admin'
node.default['ambari']['admin_password'] = 'admin'
