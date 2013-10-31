include_recipe 'fission::build_dependencies'
include_recipe 'fission::pre_build'

include_recipe "fission::#{node[:fission][:template]}"

include_recipe 'fission::post_build'
include_recipe 'fission::callbacks'
