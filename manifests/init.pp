# == Class: ssmtp
#
# This module manages SSMTP.
#
# === Parameters
#
# Document parameters here.
#
# [*defaultmta*]
#   if set to ssmtp, this class will be used
#
# [*rootemail*]
#   Mail address that get root mails
#
# [*mailhub*]
#   server that handle outgoing mail
#
# [fromlineoverride]
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
#    mailhub => 'mail.example.local',
#    rootemail => 'john.doe@example.local',
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
  $defaultmta       = $ssmtp::params::defaultmta,
  $rootemail        = $ssmtp::params::rootemail,
  $mailhub          = $ssmtp::params::mailhub,
  $revaliases       = $ssmtp::params::revaliases,
  $fromlineoverride = $ssmtp::params::fromlineoverride,
  $authuser         = undef,
  $authpass         = undef,
  $authmethod       = undef,
  $usetls           = undef,
  $usestarttls      = undef,
  $tlscert          = undef,
  $tlskey           = undef,
  $tlscafile        = undef,
  $tlscadir         = undef,
  $require_yum      = true,
) inherits ssmtp::params {

  if str2bool($require_yum) {
    # Require class yum to have the relevant repositories in place
    require yum
  }

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
