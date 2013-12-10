class nginx::http::log (
  $access_log          = '\'/var/log/nginx/access.log\'  main',
  $log_format          = 'main  \'$remote_addr - $remote_user [$time_local] "$request" \'
                      \'$status $body_bytes_sent "$http_referer" \'
                      \'"$http_user_agent" "$http_x_forwarded_for"\'',
  $open_log_file_cache = 'off') {
  file { '/etc/nginx/log.conf':
    content => template('nginx/log.conf.erb'),
    owner   => root,
    group   => root,
    notify  => Service['nginx'],
  }
}