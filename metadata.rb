name             'zpool'
maintainer       'Martha Greenberg'
maintainer_email 'marthag@mit.edu'
license          'Apache-2.0'
description      'Manages ZFS zpools'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
source_url 'https://github.com/marthag8/zpool'
issues_url 'https://github.com/marthag8/zpool/issues'

%w(solaris2 ubuntu freebsd).each do |os|
  supports os
end

chef_version '>= 12.11'
