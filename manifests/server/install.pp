# == Class: rsyslog::server:install
class rsyslog::server::install inherits rsyslog {

  package { $awscli_package_name:
    ensure => installed,
  }

}