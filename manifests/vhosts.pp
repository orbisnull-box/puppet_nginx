class orbisnull_nginx::vhosts inherits orbisnull_nginx {
  
  $vhosts_hiera = hiera_array('orbisnull_nginx::vhosts', [])  

  if $vhosts != undef {
    $vhosts_full=concat($vhosts_hiera, $vhosts)
  } 
  else {
    $vhosts_full = $vhosts_hiera
  }
  $vhosts_install = unique($vhosts_full)

  notify{"${vhosts_install}":}

  $vhosts_install.each |$vhost| {
    $hostname = $vhost[hostname]
    $port = $vhost[port]
    $path = $vhost[path]

    $vhost_file_name = "/etc/nginx/sites-available/${hostname}"

    $dirtree = dirtree($path, '/var/www')
    file {$dirtree:
      ensure => directory,
      require => File['/var/www'],
    }

    file {"${vhost_file_name}":
      ensure => file,
      content => template('orbisnull_nginx/vhost.erb'),
      notify => Exec['service nginx restart'],
    }

    $vhost_enable_name = "/etc/nginx/sites-enabled/${hostname}"
    file {"${vhost_enable_name}":
      ensure => link,
      target => $vhost_file_name,
      notify => Exec['service nginx restart'],
    }
  }
}
