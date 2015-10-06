# Class: ssmtp::config
#
# This module contain the configuration for sSMTP
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: include ssmtp::config
#
class ssmtp::config {
  # make parameters available in local scope for usage in templates
  $defaultmta       = $ssmtp::defaultmta
  $rootemail        = $ssmtp::rootemail
  $mailhub          = $ssmtp::mailhub
  $revaliases       = $ssmtp::revaliases
  $fromlineoverride = $ssmtp::fromlineoverride
  $authuser         = $ssmtp::authuser
  $authpass         = $ssmtp::authpass
  $authmethod       = $ssmtp::authmethod
  $usetls           = $ssmtp::usetls
  $usestarttls      = $ssmtp::usestarttls
  $tlscert          = $ssmtp::tlscert
  $tlskey           = $ssmtp::tlskey
  $tlscafile        = $ssmtp::tlscafile
  $tlscadir         = $ssmtp::tlscadir


  # sSMTP configuration
  file {
    $ssmtp::params::configssmtpconf:
      ensure  => file,
      mode    => '0640',
      owner   => 'root',
      group   => 'mail',
      path    => $ssmtp::params::configssmtpconf,
      content => template($ssmtp::params::configssmtpconftemplate);

    $ssmtp::params::configrevaliasesconf:
      ensure  => file,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      path    => $ssmtp::params::configrevaliasesconf,
      content => template($ssmtp::params::configrevaliasesconftemplate);
  }
}
