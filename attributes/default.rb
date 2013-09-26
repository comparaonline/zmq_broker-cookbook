default.zmq_broker.user = 'zmq_broker'
default.zmq_broker.group = 'zmq_broker'
default.zmq_broker.home = "/var/lib/#{default.zmq_broker.user}"
default.zmq_broker.repo = 'git@github.com:comparaonline/zmq_broker.git'
default.zmq_broker.location = default.zmq_broker.home
default.zmq_broker.revision = 'master'
default.zmq_broker.action = :deploy

default.zmq_broker.env = 'production'
default.zmq_broker.jruby_opts = '--2.0'
