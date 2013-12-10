class nginx::http::params {
  $default_type = 'plain/text'
  $keepalive_timeout = '75s'
  $sendfile = 'on'
}