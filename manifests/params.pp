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
      $packagecommon = 'ssmtp'

      # Config definition
      $configssmtpconf              = '/etc/ssmtp/ssmtp.conf'
      $configssmtpconftemplate      = 'ssmtp/etc/ssmtp.conf.erb'
      $configrevaliasesconf         = '/etc/ssmtp/revaliases'
      $configrevaliasesconftemplate = 'ssmtp/etc/revaliases.erb'
    }
    default  : {
      $linux = false
    }
  }

  # sSMTP definitions
  $defaultmta       = 'none'
  $rootemail        = 'john.doe@example.local'
  $mailhub          = 'mail.example.local'
  $revaliases       = ['# Custom revaliases']
  $fromlineoverride = 'YES'
}
