# == Class: rsyslog::forwarder
#
# Provides configuration for rsyslog forwarder
#
class rsyslog::forwarder {

  service { 'rsyslog':
    ensure   => 'running',
    enable   => true
  }

  file { '/etc/rsyslog.conf':
    ensure  => present,
    content => template('rsyslog/etc/rsyslog.conf.erb'),
    owner   => 'root',
    group   => 'root',
    require => Class['rsyslog::package'],
    notify  => Service['rsyslog']
  }

  file { '/etc/rsyslog.d/04-rsyslog-forwarder.conf':
    ensure  => present,
    content => template('rsyslog/etc/rsyslog.d/04-rsyslog-forwarder.conf.erb'),
    owner   => 'root',
    group   => 'root',
    require => File['/etc/rsyslog.conf'],
    notify  => Service['rsyslog']
  }

}