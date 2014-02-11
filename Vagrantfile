# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_plugin 'vagrant-berkshelf'
Vagrant.require_plugin 'vagrant-omnibus'

Vagrant.configure('2') do |config|

  config.vm.hostname = 'zmq-broker-berkshelf'

  config.omnibus.chef_version = :latest

  config.vm.box = 'opscode_ubuntu-12.04_provisionerless'
  config.vm.box_url = 'https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box'

  config.vm.network :private_network, ip: '33.33.33.10'
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'zmq_broker::default'
  end
end
