class orbisnull_nginx::repository inherits orbisnull_nginx {
  apt::source { 'nginx-source-mainline':
    location => 'http://nginx.org/packages/mainline/debian/',
    release  => 'jessie',
    repos    => 'nginx',
    key     => {'id'=>'573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62', 'source'=>'http://nginx.org/keys/nginx_signing.key'},
  }
}
