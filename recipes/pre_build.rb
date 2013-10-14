node[:fission][:build][:commands][:before][:build].each do |command|
  execute "pre_build(#{command})" do
    command command
    cwd '/tmp'
  end
end
