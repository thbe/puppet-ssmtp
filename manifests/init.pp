# Class: ssmtp
#
# This module manages sSMTP
#
# Parameters:
#  defaultMta = if set to ssmtp, this class will be used
#  rootEmail  = Mail address that get root mails
#  mailHub    = server that handle outgoing mail
#  revaliases = Array of reverse aliases
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#  include ssmtp{ mailHub=mail.example.com }
#
class ssmtp (
  $defaultMta = $ssmtp::params::defaultMta,
  $rootEmail  = $ssmtp::params::rootEmail,
  $mailHub    = $ssmtp::params::mailHub,
  $revaliases = $ssmtp::params::revaliases) inherits ssmtp::params {

  # Include Puppetlabs standard library
  include stdlib

  # Start workflow
  if $ssmtp::params::linux {
    anchor { 'ssmtp::start': }
    -> class { 'ssmtp::package': }
    ~> class { 'ssmtp::config': }
    ~> class { 'ssmtp::service': }
    ~> anchor { 'ssmtp::end': }
  }
}