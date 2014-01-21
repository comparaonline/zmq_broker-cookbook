# Cookbook Name:: zmq_broker
# Recipe:: system
#
# Copyright 2013, Compara Online S.A.
#
# All rights reserved - Do Not Redistribute

case node.platform_family
when 'debian'
  apt_repository 'chris-lea-zeromq' do
    uri        'http://ppa.launchpad.net/chris-lea/zeromq'
    components   ['main']
    distribution 'precise'
  end

  packages = %w(libzmq3-dbg libzmq3-dev libzmq3)

  packages.each do |p|
    package p
  end
when 'rhel'
  package 'zeromq3-devel'
end

# Create a normal user for running services later
group node.zmq_broker.group

file '/var/log/zmq_broker.log' do
  owner node.zmq_broker.user
  group node.zmq_broker.group
  mode '0644'
  action :create
end

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
