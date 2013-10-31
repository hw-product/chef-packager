node[:fission][:build][:commands][:before][:dependencies].each do |command|
  execute "pre_dep_install(#{command})" do
    command command
    cwd '/tmp'
  end
  not_if do
    node[:fission][:internal_overrides][:disable][:commands][:before][:dependencies]
  end
end

node[:fission][:dependencies][:build].each do |pkg_name, pkg_version|
  package pkg_name do
    if(pkg_version)
      version pkg_version
    end
  end
end

node[:fission][:build][:commands][:after][:dependencies].each do |command|
  execute "post_dep_install(#{command})" do
    command command
    cwd '/tmp'
  end
  not_if do
    node[:fission][:internal_overrides][:disable][:commands][:after][:dependencies]
  end
end
