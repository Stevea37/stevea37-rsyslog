# == Class: rsyslog::package
#
# Installs latest stable version of rsyslog package and required modules.
#
class rsyslog::package {
  notice("Running rsyslog::package")
  include apt


  #apt::ppa { 'ppa:adiscon/v8-stable ':
  #  package_manage => true,
  #}

  #exec { 'apt-update-rsyslog':
  #  command => '/usr/bin/apt-get update',
    #require => [
    #  Apt::Ppa['ppa:adiscon/v8-stable ']
    #],
  #}
  #require => [
  #  Exec['apt-update-rsyslog'],
  #],

  package { 'rsyslog':
    name => 'rsyslog',
    ensure  => present,
    allow_virtual => false
  }

  package { 'rsyslog-elasticsearch':
    name => 'rsyslog-elasticsearch',
    ensure  => present,
    allow_virtual => false,
    require => [
      Package['rsyslog'],
    ],
  }

  package { 'rsyslog-relp':
    name => 'rsyslog-relp',
    ensure  => present,
    allow_virtual => false,
    require => [
      Package['rsyslog'],
    ],
  }

}
