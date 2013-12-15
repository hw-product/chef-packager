include_recipe 'apt'
include_recipe 'builder'
include_recipe 'fpm-tng'

fission 'build the world' do
  build node[:packager][:build]
end
