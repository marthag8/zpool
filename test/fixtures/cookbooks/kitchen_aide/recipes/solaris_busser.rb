#
# Cookbook: kitchen_aide
# Recipe:   solaris_busser
#
# Copyright 2014, Nordstrom, Inc.
#
# All rights reserved - Do Not Redistribute
#
# Update system files for later test kitchen setup processing
bash 'Kitchen_setup_changes' do
  code <<-EOH
  echo 'Defaults env_keep = "PATH"' >> /etc/sudoers
  echo 'PATH=/usr/xpg4/bin:/usr/bin' >> /etc/default/login
  echo 'SUPATH=/usr/xpg4/bin:/usr/sbin:/usr/bin' >> /etc/default/login
  EOH
  not_if 'grep xpg4 /etc/default/login'
end
