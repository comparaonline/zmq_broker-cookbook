# Cookbook Name:: zmq_broker
# Recipe:: deploy
#
# Copyright 2013, Compara Online S.A.
#
# All rights reserved - Do Not Redistribute

directory "/var/log/#{node.zmq_broker.user}" do
  owner node.zmq_broker.user
  group node.zmq_broker.group
  mode 00755
  action :create
end

runit_service 'zmq_broker' do
  sv_dir "#{node.zmq_broker.home}/sv"
  service_dir "#{node.zmq_broker.home}/service"
  owner node.zmq_broker.user
  group node.zmq_broker.group
  env({
    'HOME' => node.zmq_broker.home,
    'JRUBY_OPTS' => node.zmq_broker.jruby_opts
  })

  options({
    user: node.zmq_broker.user,
    app_folder: node.zmq_broker.location + '/current'
  })

  restart_on_update false # handle restart manually
end

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

  restart_command "sv term #{node.zmq_broker.home}/service/zmq_broker"
end
