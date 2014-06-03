# == Class: ssmtp
#
# This module manages SSMTP.
#
# === Parameters
#
# Document parameters here.
#
# [*defaultMta*]
#   if set to ssmtp, this class will be used
#
# [*rootEmail*]
#   Mail address that get root mails
#
# [*mailHub*]
#   server that handle outgoing mail
#
# [*revaliases*]
#   Array of reverse aliases
#
# === Variables
#
# === Examples
#
#  class { '::ssmtp':
#    mailHub => 'mail.example.local',
#    rootEmail => 'john.doe@example.local',
#  }
#
# === Authors
#
# Author Thomas Bendler <project@bendler-net.de>
#
# === Copyright
#
# Copyright 2013 Thomas Bendler
#
class ssmtp (
  $defaultMta = $ssmtp::params::defaultMta,
  $rootEmail  = $ssmtp::params::rootEmail,
  $mailHub    = $ssmtp::params::mailHub,
  $revaliases = $ssmtp::params::revaliases) inherits ssmtp::params {
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
