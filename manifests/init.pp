class orbisnull_nginx (
  $package = $orbisnull_nginx::params::package,
  $ensure  = $obisnull_nginx::params::ensure,
  $vhosts = $obisnull_nginx::params::vhosts
) inherits orbisnull_nginx::params {
  validate_string($package)
  validate_string($ensure)

  contain  'orbisnull_nginx::repository'
  contain  'orbisnull_nginx::install'
  contain  'orbisnull_nginx::config'
  contain  'orbisnull_nginx::vhosts'

}

