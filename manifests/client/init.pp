class rsyslog::client::init inherits rsyslog {

  include rsyslog::install
  include rsyslog::config
  include rsyslog::service

}
