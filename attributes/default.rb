default.zmq_broker.user = 'zmq_broker'
default.zmq_broker.group = 'zmq_broker'
default.zmq_broker.home = "/var/lib/#{default.zmq_broker.user}"

default.zmq_broker.env = 'production'
default.zmq_broker.flags = '-ping_channel="ping" -ping_message="{\"action\": \"ping\"}" -ping_wait=60 -pub_address="tcp://*:5556" -pub_hwm=5 -sub_address="tcp://*:5555" -sub_hwm=5'
default.zmq_broker.binary_url = 'https://github.com/comparaonline/zmq_broker_go/releases/download/latest/zmq_broker_go'
