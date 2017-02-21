# == Class: rsyslogging::install
class rsyslogging::install inherits rsyslog {

  package { $package_name:
    ensure => installed,
  }

}