source 'https://supermarket.chef.io'

require 'chef/version'

if Chef::VERSION.to_f < 12.0
  cookbook 'apt', '< 4.0'
elsif Chef::VERSION.to_f < 12.9
  cookbook 'apt', '< 6.0'
end

metadata
