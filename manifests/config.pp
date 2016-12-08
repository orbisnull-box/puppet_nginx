class orbisnull_nginx::config inherits orbisnull_nginx {
  include orbisnull_nginx::utils

  file{'/etc/nginx/nginx.conf':
    ensure => file,
    content => template('orbisnull_nginx/nginx.conf.erb'),
    notify => Exec['service nginx restart'],
  }

  file{ '/etc/nginx/conf.d/00-upstreams.conf':
    ensure => file,
    content => template('orbisnull_nginx/upstream.conf.erb'),
    notify => Exec['service nginx restart'],
  }

  file{ '/etc/nginx/conf.d/default.conf':
    ensure => absent,
    notify => Exec['service nginx restart'],
  }

  file{'/etc/nginx/mime.types':
    ensure => file,
    source => 'puppet:///modules/orbisnull_nginx/mime.types',
    notify => Exec['service nginx restart'],
  }

  file{'/etc/nginx/fastcgi_params':
    ensure => file,
    source => 'puppet:///modules/orbisnull_nginx/fastcgi_params',
    notify => Exec['service nginx restart'],
  }

  file{'/etc/nginx/sites-available':
    ensure => directory,
  }

  file{'/etc/nginx/sites-enabled':
    ensure => directory,
  }

  file{'/var/www':
    ensure => directory,
  }

}
