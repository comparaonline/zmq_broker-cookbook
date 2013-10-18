# Cookbook Name:: zmq_broker
# Recipe:: system
#
# Copyright 2013, Compara Online S.A.
#
# All rights reserved - Do Not Redistribute

case node.platform_family
when 'debian'
  package 'libzmq-dev'
when 'rhel'
  package 'zeromq3-devel'
end

# Create a normal user for running services later
group node.zmq_broker.group

template '/etc/init/zmq_broker.conf' do
  source 'zmq_broker.conf.erb'
  mode 0600
  owner 'root'
  group 'root'
  variables({
    user: node.zmq_broker.user,
    group: node.zmq_broker.group,
    env: {
      'HOME' => node.zmq_broker.home,
      'JRUBY_OPTS' => node.zmq_broker.jruby_opts
    }
  })
end

service 'zmq_broker' do
  provider Chef::Provider::Service::Upstart
  supports :restart => true, :status => true
  action :enable
end
