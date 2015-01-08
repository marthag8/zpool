actions :create, :destroy

attribute :name, kind_of: String
attribute :disks, kind_of: Array
attribute :force, kind_of: [TrueClass, FalseClass], default: false
attribute :mountpoint, kind_of: String, default: nil

attribute :info, kind_of: Mixlib::ShellOut, default: nil
attribute :state, kind_of: String, default: nil

def initialize(*args)
  super
  @action = :create
end
