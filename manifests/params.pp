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
      $linux = true

      # Package definition
      $packageCommon = 'ssmtp'

      # Config definition
      $configSsmtpConf              = '/etc/ssmtp/ssmtp.conf'
      $configSsmtpConfTemplate      = 'ssmtp/etc/ssmtp.conf.erb'
      $configRevaliasesConf         = '/etc/ssmtp/revaliases'
      $configRevaliasesConfTemplate = 'ssmtp/etc/revaliases.erb'
    }
    default  : {
      $linux = false
    }
  }

  # sSMTP definitions
  $defaultMta       = 'none'
  $rootEmail        = 'john.doe@example.local'
  $mailHub          = 'mail.example.local'
  $revaliases       = ['# Custom revaliases']
  $fromlineoverride = 'YES'
}
