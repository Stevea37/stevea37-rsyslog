class rsyslog::server::init inherits rsyslog::params {

  include rsyslog::install
  include rsyslog::config
  include rsyslog::service
  include rsyslog::server::install
  include rsyslog::server::config

}
