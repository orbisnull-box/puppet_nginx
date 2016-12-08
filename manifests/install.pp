class orbisnull_nginx::install inherits orbisnull_nginx {
  include orbisnull_nginx::repository
  
   package { $package:
      ensure    => $ensure,
      name      => $package,
      require => Class['orbisnull_nginx::repository'],
      notify => Class['orbisnull_nginx::config'],
    }

}
