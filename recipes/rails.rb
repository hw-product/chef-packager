pkg_name = node[:fission][:build][:name]

node.set[:pkg_build][:rails][pkg_name][:source] = node[:fission][:source]
node.set[:pkg_build][:rails][pkg_name][:pre_commands] = node[:fission][:build][:commands][:before][:build]
node.set[:pkg_build][:rails][pkg_name][:post_commands] = node[:fission][:build][:commands][:after][:build]
node.set[:pkg_build][:rails][pkg_name][:dependencies] = node[:fission][:dependencies][:runtime]

node[:fission][:rails].each do |k,v|
  node.set[:pkg_build][:rails][pkg_name][k] = v
end

node.set[:fission][:internal_overrides][:disable][:commands][:before][:build] = true
node.set[:fission][:internal_overrides][:disable][:commands][:after][:build] = true

include_recipe 'pkg-build::rails'
