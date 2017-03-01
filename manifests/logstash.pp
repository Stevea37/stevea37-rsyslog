# == Class: rsyslog::logstash
#
# Provides configuration for logstash aggregator
#
class rsyslog::logstash(
  $elasticsearch_host = undef
)  {

  include logstash

  service { 'rsyslog':
    ensure   => 'running',
    enable   => true
  }

  logstash::configfile { 'apps-backend':
    content => template('rsyslog/etc/logstash/conf.d/apps-backend.conf.erb'),
  }

  logstash::patternfile { 'apps-backend':
    source => template('rsyslog/etc/logstash/conf.d/apps-backend.conf.erb'),
  }

}