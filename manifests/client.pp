# == Class: rsyslog::client
#
# Provides configuration for rsyslog client
#
class rsyslog::client(
  $forwarder_host = 'log-aggregator.fnc.internal',
  $server_type = $::server_type

) {
  notice("Running rsyslog::client")
  service { 'rsyslog':
    ensure   => 'running',
    enable   => true
  }

  file { '/etc/rsyslog.conf':
    ensure  => present,
    content => template('rsyslog/etc/rsyslog.conf.erb'),
    owner   => 'root',
    group   => 'root',
    notify  => Service['rsyslog']
  }

  file { '/etc/rsyslog.d/05-rsyslog-client.conf':
    ensure  => present,
    content => template('rsyslog/etc/rsyslog.d/05-rsyslog-client.conf.erb'),
    owner   => 'root',
    group   => 'root',
    require => File['/etc/rsyslog.conf'],
    notify  => Service['rsyslog']
  }

}