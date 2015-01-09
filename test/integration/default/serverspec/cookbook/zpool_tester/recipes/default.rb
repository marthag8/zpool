# set up zpools

puts "FAMILY  #{node[:platform_family]}"
case node[:platform_family]
when 'solaris2'
  include_recipe "#{cookbook_name}::solaris"
when 'debian'
  include_recipe "#{cookbook_name}::ubuntu"
end
