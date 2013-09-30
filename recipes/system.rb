# Cookbook Name:: zmq_broker
# Recipe:: system
#
# Copyright 2013, Compara Online S.A.
#
# All rights reserved - Do Not Redistribute

include_recipe 'runit'

case node.platform_family
when 'debian'
  package 'libzmq-dev'
when 'rhel'
  package 'zeromq3-devel'
end

# Create a normal user for running services later
group node.zmq_broker.group

user node.zmq_broker.user do
  comment 'zmq_broker application user'
  shell '/bin/bash'
  gid node.zmq_broker.group
  home node.zmq_broker.home
  supports manage_home: true
end

%w(sv service).each do |dir|
  directory "#{node.zmq_broker.home}/#{dir}" do
    owner node.zmq_broker.user
    group node.zmq_broker.group
    recursive true
  end
end

runit_service 'zmq_broker-services' do # allow zmq_broker to manage it's own services
  options({
    home: node.zmq_broker.home,
    user: node.zmq_broker.user
  })

  default_logger true
end
