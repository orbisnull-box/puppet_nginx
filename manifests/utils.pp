class orbisnull_nginx::utils  inherits orbisnull_nginx{
  exec { 'service nginx restart':
    user=>'root',
    group=>'root',
    path=>'/bin:/usr/bin/:/usr/sbin:/usr/local/bin',
    refreshonly => true,
    onlyif => 'nginx -t',
  }

}
