# == Class: rsyslog::server::config
class rsyslog::server::config inherits rsyslog {

  cron { 'logrotate':
    command => '/usr/sbin/logrotate',
    user    => $logrotate_cron_user,
    hour    => $logrotate_cron_hour,
    minute  => $logrotate_cron_min,
  }

  cron { 's3 archive':
    command => "aws s3 $s3_source_directory s3://$s3_bucket_name/",
    user    => $s3_cron_user,
    hour    => $s3_cron_hour,
    minute  => $s3_cron_min,
    require => Package[$awscli_package_name],
  }

}