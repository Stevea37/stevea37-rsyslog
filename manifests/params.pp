# == Class: rsyslog::params
class rsyslog::params {

  #
  # OSFamily Specific Definitions
  #

  case $::osfamily {
    'RedHat', 'Amazon': {
      $package_name = 'rsyslog'
      $service_name = ''
      $awscli_package_name = 'awscli'
    }
    'Debian': {
      $package_name = 'rsyslog'
      $service_name = ''
      $awscli_package_name = 'awscli'
    }
    default: {
      fail("Operating system '${::osfamily}' not supported. Review params.pp for extending support.")
    }
  }


  #
  # File Definitions
  #

  # Rsyslog Config File
  $rsyslog_conf_user = 'root'
  $rsyslog_conf_group = 'root'
  $rsyslog_conf_mode = 0644

  #
  # Cron Definitions
  #

  # S3 Backup definitions
  $s3_source_directory = '/path/to/dir'
  $s3_bucket_name = ''
  $s3_cron_user = 'root'
  $s3_cron_hour = 2
  $s3_cron_min = '*'
  $aws_secret_key = ''
  $aws_access_key = ''

  # Logrotate
  $logrotate_cron_user = 'root'
  $logrotate_cron_hour = 2
  $logrotate_cron_min = '*'


}