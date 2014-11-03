# CHANGELOG for zmq_broker


## 0.9.0 - 2014-11-03:
* removed support for centos
* cleaned up some code; ubuntu 14.04 comes with `libzmq3-dev`
* bumped broker version to `v0.2.0`

## 0.8.0:
* added version attribute

## 0.7.3:
* fixed flags usage
* specifying all libzmq packages wasn't required
* added some missing service description

## 0.7.2:
* restart rsyslog after deploying

## 0.7.1:
* restart rsyslog after rotating log

## 0.7.0:
* use go broker implementation

## 0.6.4:
* removed unused log directories

## 0.6.3:
* changed ppa name

## 0.6.2:
* fixed ppa uri

## 0.6.1:
* ensure zmq_broker user exists

## 0.6.0:
* use chris lea's zeromq ppa

## 0.5.2:
* ensure log file exists

## 0.5.1:
* use upstart instead of runit

## 0.4.0:
* enabled jruby performance enhancements

## 0.3.3:
* fixed log dir permissions

## 0.3.2:
* ensure log dir exists

## 0.3.1:
* make the service run with bash

## 0.3.0:
* removed timestamp from service logger

## 0.2.6:
* run app using ruby executable

## 0.2.5:
* rbenv shouldn't be required

## 0.2.4:
* added rbenv to app path

## 0.2.3:
* set bash as shell for zmq_broker user and removed zsh requirement

## 0.2.2:
* run app using bundler

## 0.2.1:
* ensure libzmq is installed

## 0.2.0:
* removed rbenv dependency

## 0.1.1:
* Use https git url

## 0.1.0:
* Initial release of zmq_broker
