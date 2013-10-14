include_recipe 'fission::build_dependencies'
include_recipe 'fission::pre_build'

pkg_name = node[:fission][:_message][:repository_name]

node.set[:pkg_build][:rails][pkg_name][:source] = node[:fission][:source]
node.set[:pkg_build][:rails][pkg_name][:pre_commands] = node[:fission][:build][:commands][:before][:build]
node.set[:pkg_build][:rails][pkg_name][:post_commands] = node[:fission][:build][:commands][:after][:build]
node.set[:pkg_build][:rails][pkg_name][:dependencies] = node[:fission][:dependencies][:runtime]

node[:fission][:rails].each do |k,v|
  node.set[:pkg_build][:rails][pkg_name][k] = v
end

include_recipe 'pkg-build::rails'
include_recipe 'fission::post_build'
