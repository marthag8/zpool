# set up zpools

zpool 'createdzpool_multiplevolumes' do
  action :destroy
end

zpool 'destroyme_zpool' do
  disks %w(c2d1 c1d1)
end

zpool 'destroyme_zpool' do
  action :destroy
end

zpool 'createdzpool' do
  disks %w(c2d0)
end

zpool 'createdzpool_multiplevolumes' do
  disks %w(c2d1 c1d1)
  force true
end
