# == Class: rsyslog
#
# Installs and configures artifactory
#
#
class rsyslog {

  include rsyslog::package
  include rsyslog::archiver

}
