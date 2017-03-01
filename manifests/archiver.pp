# == Class: rsyslog::archiver
#
# Provides configuration for rsyslog archiver
#
class rsyslog::archiver {

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

  file { '/etc/rsyslog.d/03-rsyslog-archiver.conf':
    ensure  => present,
    content => template('rsyslog/etc/rsyslog.d/03-rsyslog-archiver.conf.erb'),
    owner   => 'root',
    group   => 'root',
    require => File['/etc/rsyslog.conf'],
    notify  => Service['rsyslog']
  }

  file { '/etc/logrotate.d/s3-backup':
    ensure  => present,
    content => template('rsyslog/etc/logrotate.d/s3-backup.erb'),
    owner   => 'root',
    group   => 'root',
    require => File['/etc/rsyslog.d/03-rsyslog-archiver.conf']
  }

}