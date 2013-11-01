

action :run do

  builder = lambda do |config|
    resource_name = "#{fission}_#{config[:build][:template]}".to_sym
    self.send(resource_name, "#{config[:build][:name]}") do
      args config
    end
  end

  dep_builder = lambda do |pkg|
    pkg.each do |name, opts|
      if(opts[:dependencies][:package])
        dep_builder.call(opts[:dependences][:package])
      end
      builder.call(opts)
    end
  end

  dep_builder.call(new_resource.build)

end
