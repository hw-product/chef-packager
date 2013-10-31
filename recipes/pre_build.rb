node[:fission][:build][:commands][:before][:build].each do |command|
  execute "pre_build(#{command})" do
    command command
    cwd '/tmp'
  end
  not_if do
    node[:fission][:internal_overrides][:disable][:commands][:before][:build]
  end
end
