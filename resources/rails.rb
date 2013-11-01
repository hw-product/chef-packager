include Fission::Reactor::Station

action :build
default_action :build

attribute :args, :kind_of => Hash, :required => true
