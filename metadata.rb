# encoding: utf-8

name             'zmq_broker'
maintainer       'Compara Online S.A.'
maintainer_email 'ggayan@comparaonline.com'
license          'All rights reserved'
description      'Configures and deploys zmq_broker application to node'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.6.1'

depends 'apt', '~> 2.3.4'
