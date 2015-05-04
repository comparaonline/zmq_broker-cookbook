default['zmq_broker']['user'] = 'zmq_broker'
default['zmq_broker']['group'] = 'zmq_broker'
default['zmq_broker']['home'] = "/var/lib/#{default['zmq_broker']['user']}"

default['zmq_broker']['env'] = 'production'
default['zmq_broker']['flags'] = ''
default['zmq_broker']['version'] = 'v0.0.1'
default['zmq_broker']['binary_url'] = "https://github.com/comparaonline/zmq_broker_go/releases/download/#{default['zmq_broker']['version']}/zmq_broker_go"
