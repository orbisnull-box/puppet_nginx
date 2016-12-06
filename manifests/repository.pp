class orbisnull_nginx::repository inherits orbisnull_nginx {
  apt::source { 'nginx-source-mainline':
    location => 'http://nginx.org/packages/mainline/debian/',
    release  => 'jessie',
    repos    => 'nginx',
    require => Exec['apt-key nginx'],
  }

  $key = '573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62'
  exec { 'apt-key nginx':
    path    => '/bin:/usr/bin',
    onlyif  => '/bin/bash -c "! /usr/bin/apt-key adv --list-public-keys --with-fingerprint --with-colons | grep -q ${key}"',
    command => 'wget -qO - http://nginx.org/keys/nginx_signing.key | apt-key add -'
  }
}
