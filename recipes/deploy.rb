# Cookbook Name:: zmq_broker
# Recipe:: deploy
#
# Copyright 2013, Compara Online S.A.
#
# All rights reserved - Do Not Redistribute

deploy_revision node.zmq_broker.location do
  retries 2
  action node.zmq_broker.action
  user node.zmq_broker.user
  group node.zmq_broker.group
  repo node.zmq_broker.repo
  revision node.zmq_broker.revision

  migrate false
  symlink_before_migrate.clear
  purge_before_symlink.clear
  create_dirs_before_symlink.clear
  symlinks.clear

  before_migrate do
    current_release_directory = release_path
    bundler_depot = new_resource.shared_path + '/bundle'
    excluded_groups = %w(development test)

    rbenv_script 'Bundling the gems' do
      cwd current_release_directory
      user node.zmq_broker.user
      group node.zmq_broker.group
      code <<-EOS
        bundle install --quiet --deployment --binstubs --path #{bundler_depot} \
          --without #{excluded_groups.join(' ')}
      EOS
      returns [0]
    end
  end

  notifies :restart, "service[zmq_broker]"
end
