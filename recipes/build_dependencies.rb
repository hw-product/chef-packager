
node[:fission][:build][:commands][:before][:dependencies].each do |command|
  execute "pre_dep_install(#{command})" do
    command command
    cwd '/tmp'
  end
end

node[:fission][:dependencies][:build].each do |dep|
  package dep
end

node[:fission][:build][:commands][:after][:dependencies].each do |command|
  execute "post_dep_install(#{command})" do
    command command
    cwd '/tmp'
  end
end
