class nginx::http (
  $default_type      = $nginx::http::params::default_type,
  $keepalive_timeout = $nginx::http::params::keepalive_timeout,
  $sendfile          = $nginx::http::params::sendfile,) inherits nginx::http::params {
  file { '/etc/nginx/http.conf':
    content => template('nginx/http.conf.erb'),
    owner   => root,
    group   => root,
    notify  => Service['nginx'],
  }
  
  class { 'nginx::http::log': 
    require => Package['nginx'],
  }
}