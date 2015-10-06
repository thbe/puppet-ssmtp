# Class: ssmtp::service
#
# This module contain the service configuration for sSMTP
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: include ssmtp::service
#
class ssmtp::service {

  # sSMTP service configuration
  if $ssmtp::defaultmta == 'ssmtp' {
    exec { 'alternatives --set mta /usr/sbin/sendmail.ssmtp':
      path   => '/bin:/sbin:/usr/bin:/usr/sbin',
      unless => 'test /etc/alternatives/mta -ef /usr/sbin/sendmail.ssmtp',
    }
  }
}
