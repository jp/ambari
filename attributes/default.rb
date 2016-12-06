#
# Cookbook Name:: ambari
# Attributes:: default
#

# node.default['ambari']['server_fqdn'] = 'localhost'

# Set default version of Ambari.  Overwrite this to install a different version.
node.default['ambari']['version'] = '2.2.1'

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
  node.default['ambari']['debian_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/debian7/2.x/updates/2.1.2'
when '2.2', '2.2.0'
  node.default['ambari']['rhel_6_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.2.0.0/ambari.repo'
  node.default['ambari']['rhel_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.2.0.0/ambari.repo'
  node.default['ambari']['suse_11_repo'] = 'http://public-repo-1.hortonworks.com/ambari/suse11/2.x/updates/2.2.0.0/ambari.repo'
  node.default['ambari']['ubuntu_12_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.2.0.0'
  node.default['ambari']['ubuntu_14_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu14/2.x/updates/2.2.0.0'
  node.default['ambari']['debian_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/debian7/2.x/updates/2.2.0.0'
when '2.2.1'
  node.default['ambari']['rhel_6_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.2.1.1/ambari.repo'
  node.default['ambari']['rhel_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.2.1.1/ambari.repo'
  node.default['ambari']['suse_11_repo'] = 'http://public-repo-1.hortonworks.com/ambari/suse11/2.x/updates/2.2.1.1/ambari.repo'
  node.default['ambari']['ubuntu_12_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.2.1.1'
  node.default['ambari']['ubuntu_14_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu14/2.x/updates/2.2.1.1'
  node.default['ambari']['debian_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/debian7/2.x/updates/2.2.1.1'
when '2.2.2'
  node.default['ambari']['rhel_6_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.2.2.0/ambari.repo'
  node.default['ambari']['rhel_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.2.2.0/ambari.repo'
  node.default['ambari']['suse_11_repo'] = 'http://public-repo-1.hortonworks.com/ambari/suse11/2.x/updates/2.2.2.0/ambari.repo'
  node.default['ambari']['ubuntu_12_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.2.2.0'
  node.default['ambari']['ubuntu_14_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu14/2.x/updates/2.2.2.0'
  node.default['ambari']['debian_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/debian7/2.x/updates/2.2.2.0'
when '2.4.0'
  node.default['ambari']['rhel_6_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.4.0.1/ambari.repo'
  node.default['ambari']['rhel_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.4.0.1/ambari.repo'
  node.default['ambari']['suse_11_repo'] = 'http://public-repo-1.hortonworks.com/ambari/suse11/2.x/updates/2.4.0.1/ambari.repo'
  node.default['ambari']['ubuntu_12_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.4.0.1'
  node.default['ambari']['ubuntu_14_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu14/2.x/updates/2.4.0.1'
  node.default['ambari']['debian_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/debian7/2.x/updates/2.4.0.1'
when '2.4', '2.4.2', '2.4.2.0'
  node.default['ambari']['rhel_6_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.4.2.0/ambari.repo'
  node.default['ambari']['rhel_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.4.2.0/ambari.repo'
  node.default['ambari']['suse_11_repo'] = 'http://public-repo-1.hortonworks.com/ambari/suse11/2.x/updates/2.4.2.0/ambari.repo'
  node.default['ambari']['ubuntu_12_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.4.2.0'
  node.default['ambari']['ubuntu_14_repo'] = 'http://public-repo-1.hortonworks.com/ambari/ubuntu14/2.x/updates/2.4.2.0'
  node.default['ambari']['debian_7_repo'] = 'http://public-repo-1.hortonworks.com/ambari/debian7/2.x/updates/2.4.2.0'
end

node.default['ambari']['admin_user'] = 'admin'
node.default['ambari']['admin_password'] = 'admin'

# DB attributes
node.default['ambari']['database']['type'] = 'embedded' # embedded|mysql (can support following in the future oracle|mssql|postgres|sqlanywhere)
# These attributes below are omittied if database type is 'embedded'.
node.default['ambari']['database']['host'] = 'localhost'
node.default['ambari']['database']['port'] = '3306'
node.default['ambari']['database']['name'] = 'ambari'
node.default['ambari']['database']['username'] = 'ambari'
node.default['ambari']['database']['password'] = 'bigdata'

# JDBC attributes, will only be used if url is specified and db type isn't 'embedded'.
node.default['ambari']['jdbc']['url'] = '' # leave blank if no remote file
node.default['ambari']['jdbc']['path'] = '/usr/share/java/mysql-connector-java.jar'
