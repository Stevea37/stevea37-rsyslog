# == Class: rsyslogging::service
class rsyslogging::service inherits rsyslog {

  service { $service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require => Package[$package_name],
  }

}