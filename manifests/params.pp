# Class: ssmtp::params
#
# This module contain the parameters for sSMTP
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: include ssmtp::params
#
class ssmtp::params {

  # Operating system specific definitions
  case $::osfamily {
    'RedHat' : {
      $linux                            = true

      # Package definition
      $package_ssmtp                    = 'ssmtp'

      # Config definition
      $config_ssmtp_conf                = '/etc/ssmtp/ssmtp.conf'
      $config_ssmtp_conf_template       = 'ssmtp/etc/ssmtp.conf.erb'
      $config_revaliases_conf           = '/etc/ssmtp/revaliases'
      $config_revaliases_conf_template  = 'ssmtp/etc/revaliases.erb'
    }
    default  : {
      $linux                            = false
    }
  }

  # sSMTP definitions
  $default_mta         = 'none'
  $root_email          = 'john.doe@example.local'
  $mail_hub            = 'mail.example.local'
  $revaliases          = ['# Custom revaliases']
  $from_line_override  = 'YES'
}
