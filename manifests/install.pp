# == Class: rsyslog::install
class rsyslog::install inherits rsyslog {

  package { $package_name:
    ensure => installed,
  }

}