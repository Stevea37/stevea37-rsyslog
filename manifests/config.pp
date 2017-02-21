# == Class: rsyslog::config
class rsyslog::config inherits rsyslog {

  file { '/etc/rsyslog.conf':
    ensure  => file,
    owner   => $rsyslog_conf_user,
    group   => $rsyslog_conf_group,
    mode    => $rsyslog_conf_mode,
    content => template($module_name/rsyslog.conf.erb),
  }

}