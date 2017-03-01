# == Class: rsyslog::package
#
# Installs latest stable version of rsyslog package and required modules.
#
class rsyslog::package {

  include apt

  notice("Running install")
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
  }

  package { 'rsyslog-elasticsearch':
    name => 'rsyslog-elasticsearch',
    ensure  => present,
    require => [
      Package['rsyslog'],
    ],
  }

  package { 'rsyslog-relp':
    name => 'rsyslog-relp',
    ensure  => present,
    require => [
      Package['rsyslog'],
    ],
  }

}
