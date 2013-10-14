node[:fission][:callbacks].each do |name, config|
  case config[:type].to_sym
  when :fission
  when :webservice
  else
    Chef::Log.error "Fission callback: Unknown callback type provided: #{config[:type]}"
  end
end
