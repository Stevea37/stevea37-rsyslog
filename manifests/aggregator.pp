# == Class: rsyslog::aggregator
#
# Provides configuration for rsyslog aggregator
#
class rsyslog::aggregator {

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

  file { '/etc/rsyslog.d/02-rsyslog-aggregator.conf':
    ensure  => present,
    content => template('rsyslog/etc/rsyslog.d/02-rsyslog-aggregator.conf.erb'),
    owner   => 'root',
    group   => 'root',
    require => File['/etc/rsyslog.conf'],
    notify  => Service['rsyslog']
  }

}