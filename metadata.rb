name             'ambari'
maintainer       'JULIEN PELLET'
maintainer_email 'chef@julienpellet.com'
license          'Apache-2.0'
description      'Installs/Configures ambari'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.4.0'

%w(
  amazon
  centos
  redhat
  scientific
).each do |rhel|
  supports rhel, '>= 5.0'
end

supports 'suse', '>= 11.0'
supports 'ubuntu', '>= 12.0'

depends 'apt'

chef_version '>= 11' if respond_to?(:chef_version)
source_url 'https://github.com/jp/ambari' if respond_to?(:source_url)
issues_url 'https://github.com/jp/ambari/issues' if respond_to?(:issues_url)
