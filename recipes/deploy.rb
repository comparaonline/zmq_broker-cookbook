# Cookbook Name:: zmq_broker
# Recipe:: deploy
#
# Copyright 2013, Compara Online S.A.
#
# All rights reserved - Do Not Redistribute

remote_file "#{node['zmq_broker']['home']}/zmq_broker_go" do
  source node['zmq_broker']['binary_url']
  mode 00700
  user node['zmq_broker']['user']
  group node['zmq_broker']['group']
  notifies :restart, 'service[zmq_broker]'
end
