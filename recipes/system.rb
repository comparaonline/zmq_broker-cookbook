# Cookbook Name:: zmq_broker
# Recipe:: system
#
# Copyright 2013, Compara Online S.A.
#
# All rights reserved - Do Not Redistribute

include_recipe 'apt'
include_recipe 'logrotate'

package 'libzmq3-dev'

# Create a normal user for running services later
group node['zmq_broker']['group']

# ensure user exists
user node['zmq_broker']['user'] do
  gid node['zmq_broker']['group']
  home node['zmq_broker']['home']

  supports manage_home: true
end

file '/var/log/zmq_broker.log' do
  owner node['zmq_broker']['user']
  group 'adm'
  mode '0644'
  action :create
end

logrotate_app 'zmq_broker' do
  path      '/var/log/zmq_broker.log'
  frequency 'weekly'
  rotate    4 # keep old logs for x * frequency
  create    '644 root adm'
end

template '/etc/init/zmq_broker.conf' do
  source 'zmq_broker.conf.erb'
  mode 0600
  owner 'root'
  group 'root'
  variables({
    user: node['zmq_broker']['user'],
    group: node['zmq_broker']['group'],
    env: {
      'HOME' => node['zmq_broker']['home']
    },
    flags: node['zmq_broker']['flags']
  })
end

service 'zmq_broker' do
  provider Chef::Provider::Service::Upstart
  supports restart: true, status: true
  action :enable
end
