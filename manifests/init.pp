# == Class: ssmtp
#
# This module manages SSMTP.
#
# === Parameters
#
# Document parameters here.
#
# [*default_mta*]
#   if set to ssmtp, this class will be used
#
# [*root_email*]
#   Mail address that get root mails
#
# [*mail_hub*]
#   server that handle outgoing mail
#
# [from_line_override]
#   Default: YES
#
# [*revaliases*]
#   Array of reverse aliases
#
# [authuser]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [authpass]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [authmethod]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [tlscert]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [tlskey]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [authuser]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [tlscafile]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [tlscadir]
#   ssmtp.conf parameter. see man 5 ssmtp.conf
#
# [require_yum] (bool, default=true)
#   It set to false module yum will not be required.
#
# === Variables
#
# === Examples
#
#  class { '::ssmtp':
#    mail_hub   => 'mail.example.local',
#    root_email => 'john.doe@example.local',
#  }
#
# === Authors
#
# Thomas Bendler <project@bendler-net.de>
# Thomas Mueller <mueller@puzzle.ch>
#
# === Copyright
#
# Copyright 2015 Thomas Bendler
#
class ssmtp (
  $default_mta        = $ssmtp::params::defaultmta,
  $root_email         = $ssmtp::params::rootemail,
  $mail_hub           = $ssmtp::params::mailhub,
  $revaliases         = $ssmtp::params::revaliases,
  $from_line_override = $ssmtp::params::fromlineoverride,
  $authuser           = undef,
  $authpass           = undef,
  $authmethod         = undef,
  $usetls             = undef,
  $usestarttls        = undef,
  $tlscert            = undef,
  $tlskey             = undef,
  $tlscafile          = undef,
  $tlscadir           = undef,
) inherits ssmtp::params {

  # Start workflow
  if $ssmtp::params::linux {
    # Containment
    contain ssmtp::package
    contain ssmtp::config
    contain ssmtp::service

    Class['ssmtp::package'] ->
    Class['ssmtp::config'] ->
    Class['ssmtp::service']
  }
}
