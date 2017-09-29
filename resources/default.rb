include Chef::Mixin::ShellOut

property :name, String, name_property: true
property :ashift, Integer, default: 0
property :disks, Array, default: []
property :force, [true, false], default: false
property :mountpoint, String
property :recursive, [true, false], default: false
property :raid, [String, NilClass], equal_to: %w(mirror raidz raidz2 raidz3)

action :create do
  if created?
    if online?
      disks.each do |disk|
        short_disk = disk.split('/').last
        next if vdevs.include?(short_disk)
        next if vdevs.include?(disk)
        Chef::Log.info("Adding #{disk} to pool #{name}")
        shell_out!("zpool add #{args_from_resource} #{name} #{disk}")
      end
    else
      Chef::Log.warn("Zpool #{name} is #{state}")
    end
  else
    Chef::Log.info("Creating zpool #{name}")
    mount_point = mountpoint ? "-m #{mountpoint}" : ''
    shell_out!("zpool create #{mount_point} #{args_from_resource} #{name} #{raid} #{disks.join(' ')}")
  end
end

action :destroy do
  if created?
    Chef::Log.info("Destroying zpool #{name}")
    shell_out!("zpool destroy #{args_from_resource} #{name}")
  end
end

def args_from_resource
  args = []
  args << '-f' if force
  args << '-r' if recursive

  # Properties
  if ashift > 0
    args << '-o'
    args << format('ashift=%s', ashift)
  end

  args.join(' ')
end

def created?
  info.exitstatus == 0
end

def state
  info.stdout.chomp
end

def info
  shell_out("zpool list -H -o health #{name}")
end

def vdevs
  @vdevs ||= shell_out!("zpool status #{name}").stdout.lines.map do |line|
    next unless line.chomp =~ /^[\t]  /
    line.chomp.split("\s")[0]
  end
end

def online?
  state == 'ONLINE'
end
