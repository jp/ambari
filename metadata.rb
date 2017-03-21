name             'ambari'
maintainer       'JULIEN PELLET'
maintainer_email 'chef@julienpellet.com'
license          'Apache 2.0'
description      'Installs/Configures ambari'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.4.0'

supports 'redhat', '>= 5.0'
supports 'centos', '>= 5.0'
supports 'amazon', '>= 5.0'
supports 'scientific', '>= 5.0'
supports 'suse', '>= 11.0'
supports 'ubuntu', '>= 12.0'

depends 'apt'

source_url 'https://github.com/jp/ambari' if respond_to?(:source_url)
issues_url 'https://github.com/jp/ambari/issues' if respond_to?(:issues_url)
