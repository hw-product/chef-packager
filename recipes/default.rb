# Default build

if(node[:fission][:template])
  include_recipe "fission::#{node[:fission][:template]}"
end

include_recipe 'fission::callbacks'
