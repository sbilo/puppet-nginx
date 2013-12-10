sbilo-nginx
===========

This module configures an Nginx installation. Allows for configuring servers and locations. For terminology check the nginx.org website.

Configure a server
------------------
Basic configuration of a server. Make sure you don't use slashes in the names of locations.

	nginx::server { $::fqdn:
		listen	=> '80 default_server',
	}
	
	nginx::server::location { 'default':
    	server   => $::fqdn,
    	location => '/',
    	root	 => '/home/myawesomewebsite',
    }