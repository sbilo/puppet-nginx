define nginx::server::ssl (
  $server                 = $name,
  $ssl                    = 'on',
  $ssl_certificate        = undef,
  $ssl_certificate_key    = undef,
  $ssl_crl                = undef,
  $ssl_client_certificate = undef,
  $ssl_ciphers            = undef,
  $ssl_protocols          = undef,
  $ssl_verify_client      = undef,) {
  if ($ssl) {
    ::concat::fragment { "${name}:ssl":
      target  => "/etc/nginx/conf.d/${server}.conf",
      content => "
    ssl ${ssl};",
      order   => '001'
    }
  }

  if ($ssl_certificate) {
    ::concat::fragment { "${name}:ssl_certificate":
      target  => "/etc/nginx/conf.d/${server}.conf",
      content => "
    ssl_certificate ${ssl_certificate};",
      order   => '001'
    }
  }

  if ($ssl_certificate_key) {
    ::concat::fragment { "${name}:ssl_certificate_key":
      target  => "/etc/nginx/conf.d/${server}.conf",
      content => "
    ssl_certificate_key ${ssl_certificate_key};",
      order   => '001'
    }
  }
  
    if ($ssl_crl) {
    ::concat::fragment { "${name}:ssl_crl":
      target  => "/etc/nginx/conf.d/${server}.conf",
      content => "
    ssl_crl ${ssl_crl};",
      order   => '001'
    }
  }

  if ($ssl_client_certificate) {
    ::concat::fragment { "${name}:ssl_client_certificate":
      target  => "/etc/nginx/conf.d/${server}.conf",
      content => "
    ssl_client_certificate ${ssl_client_certificate};",
      order   => '001'
    }
  }

  if ($ssl_ciphers) {
    ::concat::fragment { "${name}:ssl_ciphers":
      target  => "/etc/nginx/conf.d/${server}.conf",
      content => "
    ssl_ciphers ${ssl_ciphers};",
      order   => '001'
    }
  }

  if ($ssl_protocols) {
    ::concat::fragment { "${name}:ssl_protocols":
      target  => "/etc/nginx/conf.d/${server}.conf",
      content => "
    ssl_protocols ${ssl_protocols};",
      order   => '001'
    }
  }

  if ($ssl_verify_client) {
    ::concat::fragment { "${name}:ssl_verify_client":
      target  => "/etc/nginx/conf.d/${server}.conf",
      content => "
    ssl_verify_client ${ssl_verify_client};",
      order   => '001'
    }
  }
}