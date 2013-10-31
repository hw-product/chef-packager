node[:fission][:build][:commands][:after][:build].each do |command|
  execute "post_build(#{command})" do
    command command
    cwd '/tmp'
  end
  not_if do
    node[:fission][:internal_overrides][:disable][:commands][:after][:build]
  end
end

node[:fission][:build][:commands][:before][:package].each do |command|
  execute "pre_package(#{command})" do
    command command
    cwd '/tmp'
  end
  not_if do
    node[:fission][:internal_overrides][:disable][:commands][:before][:package]
  end
end
