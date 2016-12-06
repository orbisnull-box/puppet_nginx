class orbisnull_nginx (
  $package = $orbisnull_nginx::params::package,
  $ensure              = $orbisnull_nginx::params::ensure,
) inherits orbisnull_nginx::params {
  validate_string($package)
  validate_string($ensure)

  contain  'orbisnull_nginx::repository'
  contain  'orbisnull_nginx::install'
}

