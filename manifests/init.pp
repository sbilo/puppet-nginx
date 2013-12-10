# Class: nginx
#
# This module manages nginx
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class nginx (
  $user             = $nginx::params::user,
  $worker_processes = $nginx::params::worker_processes,
  $error_log        = $nginx::params::error_log,
  $pid              = $nginx::params::pid,) inherits nginx::params {
  apt::source { 'nginx':
    location   => 'http://nginx.org/packages/ubuntu',
    repos      => 'nginx',
    key        => '7BD9BF62',
    key_server => 'hkp://keyserver.ubuntu.com:80',
  } ->
  package { 'nginx': ensure => installed, }

  service { 'nginx':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    provider   => 'upstart',
  }

  file { ['/etc/nginx/conf.d/default.conf', '/etc/nginx/conf.d/example_ssl.conf']:
    ensure  => absent,
    notify  => Service['nginx'],
    require => Package['nginx'],
  }

  file { '/etc/nginx/nginx.conf':
    content => template('nginx/nginx.conf.erb'),
    owner   => root,
    group   => root,
    notify  => Service['nginx'],
    require => Package['nginx'],
  }

  class { 'nginx::http':
    require => Package['nginx'],
  }

  class { 'nginx::events':
    require => Package['nginx'],
  }
}