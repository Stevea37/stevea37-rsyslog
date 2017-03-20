# == Class: rsyslog::package
#
# Installs latest stable version of rsyslog package and required modules.
#
class rsyslog::package {
  notice("Running rsyslog::package")

  if $::osfamily != "RedHat" {
    include apt
  }



  package { 'rsyslog':
    name => 'rsyslog',
    ensure  => present,
    allow_virtual => false
  }

  if $osfamily != "RedHat" {
    package { 'rsyslog-elasticsearch':
      name          => 'rsyslog-elasticsearch',
      ensure        => present,
      allow_virtual => false,
      require       => [
        Package['rsyslog'],
      ],
    }

    package { 'rsyslog-relp':
      name          => 'rsyslog-relp',
      ensure        => present,
      allow_virtual => false,
      require       => [
        Package['rsyslog'],
      ],
    }
  }
}
