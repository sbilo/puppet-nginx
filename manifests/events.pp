class nginx::events (
  $accept_mutex     = $nginx::events::params::accept_mutex,
  $accept_mutex_delay       = $nginx::events::params::accept_mutex_delay,
  $multi_accept     = $nginx::events::params::multi_accept,
  $worker_connections       = $nginx::events::params::worker_connections,) inherits nginx::events::params {
  file { '/etc/nginx/events.conf':
    content => template('nginx/events.conf.erb'),
    owner   => root,
    group   => root,
    notify  => Service['nginx'],
  }
}