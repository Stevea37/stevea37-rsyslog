# == Class: rsyslog
#
# Installs and configures artifactory
#
#
class rsyslog {
  notice("Running rsyslog::init")
  include rsyslog::package
  #include rsyslog::client
  include rsyslog::archiver

}
