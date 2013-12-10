define nginx::server::location (
  $server,
  $location         = '/',
  $root             = undef,
  $proxy_pass       = undef,
  $proxy_redirect   = undef,
  $proxy_set_header = [{}]) {
  ::concat::fragment { "${server}:${location}header":
    target  => "/etc/nginx/conf.d/${server}.conf",
    content => "
    location ${location} {",
    order   => "001-${name}-000",
  }

  if ($root) {
    ::concat::fragment { "${server}:${location}root":
      target  => "/etc/nginx/conf.d/${server}.conf",
      content => "
        root ${root};",
      order   => "002-${name}-001",
    }
  }

  if ($proxy_pass) {
    ::concat::fragment { "${server}:${location}proxy_pass":
      target  => "/etc/nginx/conf.d/${server}.conf",
      content => "
        proxy_pass ${proxy_pass};",
      order   => "001-${name}-002",
    }
  }

  if ($proxy_redirect) {
    ::concat::fragment { "${server}:${location}proxy_redirect":
      target  => "/etc/nginx/conf.d/${server}.conf",
      content => "
        proxy_redirect ${proxy_redirect};",
      order   => "001-${name}-002",
    }
  }
  
  if(size($proxy_set_header) >0) {
    ::concat::fragment { "${server}:${location}proxy_set_header":
      target  => "/etc/nginx/conf.d/${server}.conf",
      content => inline_template("
<% @proxy_set_header.each do |hash| -%>
<% hash.keys.each do |key| -%>
        proxy_set_header <%= key %> <%= hash[key] %>;
<% end -%><% end -%>"),
      order   => "001-${name}-002",
    }
  }

  ::concat::fragment { "${server}:${location}footer":
    target  => "/etc/nginx/conf.d/${server}.conf",
    content => "
    }",
    order   => "001-${name}-999",
  }
}