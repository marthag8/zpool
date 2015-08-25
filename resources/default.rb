actions :create, :destroy

attribute :name, kind_of: String, name_attribute: true
attribute :ashift, kind_of: Integer, default: 0
attribute :disks, kind_of: Array
attribute :force, kind_of: [TrueClass, FalseClass], default: false
attribute :info, kind_of: Mixlib::ShellOut, default: nil
attribute :mountpoint, kind_of: String, default: nil
attribute :recursive, kind_of: [TrueClass, FalseClass], default: false
attribute :state, kind_of: String, default: nil

def initialize(*args)
  super
  @action = :create
end
