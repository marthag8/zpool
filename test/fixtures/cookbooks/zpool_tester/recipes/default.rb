# install zpool support
package 'zfs-fuse' do
  only_if { platform_family?('debian') }
end

# set up zpools
%w(disk0 disk1 disk2 disk3 disk4 disk5).each do |disk|
  execute disk  do
    command "dd if=/dev/zero of=/#{disk} bs=1024 count=65536"
    not_if { File.exist?("/#{disk}") }
  end
end

zpool 'create_zpool1' do
  name 'zpool1'
  disks %w(/disk0)
end

zpool 'create_zpool1' do
  name 'zpool2'
  disks %w(/disk1)
end

zpool 'create_multiplevolumes' do
  name 'multiplevolumes'
  disks %w(/disk2 /disk3)
  force true
end

zpool 'destroy_zpool' do
  name 'zpool2'
  action :destroy
end

zpool 'test' do
  disks %w(/disk4 /disk5)
end
