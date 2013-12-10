define nginx::server ($listen = 80, $server_name = undef, $server_tokens = 'on') {
  class { 'nginx': }

  ::concat { "/etc/nginx/conf.d/${name}.conf":
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    notify => Service['nginx'],
  }

  ::concat::fragment { "${name}:header":
    target  => "/etc/nginx/conf.d/${name}.conf",
    content => "server {
    listen ${listen};",
    order   => '000'
  }
  
  if ($server_name) {
    ::concat::fragment { "${name}:server_name":
      target  => "/etc/nginx/conf.d/${name}.conf",
      content => "
      server_name ${server_name};",
      order   => "000",
    }
  }

  ::concat::fragment { "${name}:footer":
    target  => "/etc/nginx/conf.d/${name}.conf",
    content => '
}',
    order   => '999'
  }
}