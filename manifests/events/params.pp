class nginx::events::params {
  $accept_mutex = on
  $accept_mutex_delay  = '500ms'
  $multi_accept = 'off'
  $worker_connections = 1024
}