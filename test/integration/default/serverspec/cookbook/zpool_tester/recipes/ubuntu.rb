# install zpool support
package 'zfs-fuse'

# set up zpools

zpool 'createdzpool_multiplevolumes' do
  action :destroy
end

zpool 'destroyme_zpool' do
  disks %w(/dev/sdb /dev/sdc)
end

zpool 'destroyme_zpool' do
  action :destroy
end

zpool 'createdzpool' do
  disks %w(/dev/sdd)
end

zpool 'createdzpool_multiplevolumes' do
  disks %w(/dev/sdb /dev/sdc)
  force true
end
