# == Class: rsyslog::package
#
# Installs latest stable version of rsyslog package and required modules.
#
class rsyslog::package {
  notice("Running rsyslog::package")

  if $::osfamily == "Debian" {
    package { 'rsyslog':
      name          => 'rsyslog',
      ensure        => present,
      allow_virtual => false
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
  elsif $::osfamily == "RedHat" {

    file { '/etc/yum.repos.d/rsyslog.repo':
      ensure  => present,
      content => template('rsyslog/etc/rsyslog.repo.erb'),
      owner   => 'root',
      group   => 'root',
    }

    package { 'rsyslog':
      name          => 'rsyslog',
      ensure        => present,
      allow_virtual => false,
      install_options  => ['--disablerepo=amzn-main'],
      require       => [
        File['/etc/yum.repos.d/rsyslog.repo']
      ],
    }

    package { 'rsyslog-relp':
      name          => 'rsyslog-relp',
      ensure        => present,
      allow_virtual => false,
      install_options  => ['--disablerepo=amzn-main'],
      require       => [
        Package['rsyslog'],
      ],
    }
  }
}
