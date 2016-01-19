# Class: ssmtp
# ===========================
#
# This class manage local ssmtp installation
#
# Parameters
# ----------
#
# * `default_mta`
#  If set to ssmtp, ssmtp will be set as default mta
#
# * `root_email`
#  Mail address that get root mails
#
# * `mail_hub`
#  Server that is used for outgoing mail
#
# * `from_line_override` (default=YES)
#  Allow mail client to override from line
#
# * `revaliases`
#  Array of reverse aliases
#
# * `hostname`
#  Override ssmtp.conf parameter, see man 5 ssmtp.conf
#
# * `rewritedomain`
#  Override ssmtp.conf parameter, see man 5 ssmtp.conf
#
# * `authuser`
#  Override ssmtp.conf parameter, see man 5 ssmtp.conf
#
# * `authpass`
#  Override ssmtp.conf parameter, see man 5 ssmtp.conf
#
# * `authmethod`
#  Override ssmtp.conf parameter, see man 5 ssmtp.conf
#
# * `tlscert`
#  Override ssmtp.conf parameter, see man 5 ssmtp.conf
#
# * `tlskey`
#  Override ssmtp.conf parameter, see man 5 ssmtp.conf
#
# * `authuser`
#  Override ssmtp.conf parameter, see man 5 ssmtp.conf
#
# * `tlscafile`
#  Override ssmtp.conf parameter, see man 5 ssmtp.conf
#
# * `tlscadir`
#  Override ssmtp.conf parameter, see man 5 ssmtp.conf
#
# * `require_yum` (bool, default=true)
#  Override ssmtp.conf parameter, see man 5 ssmtp.conf
#
# Variables
# ----------
#
# * `osfamily`
#  This variable is used to determin if module can be used on current operating
#  system or not
#
# Examples
# --------
#
# @example
#    class { '::ssmtp':
#      mail_hub   => 'mail.example.local',
#      root_email => 'john.doe@example.local',
#    }
#
# Authors
# -------
#
# Thomas Bendler <project@bendler-net.de>
# Thomas Mueller <mueller@puzzle.ch>
#
# Copyright
# ---------
#
# Copyright 2016 Thomas Bendler, unless otherwise noted.
#
class ssmtp (
  $default_mta        = $ssmtp::params::default_mta,
  $root_email         = $ssmtp::params::root_email,
  $mail_hub           = $ssmtp::params::mail_hub,
  $revaliases         = $ssmtp::params::revaliases,
  $from_line_override = $ssmtp::params::from_line_override,
  $hostname           = undef,
  $rewritedomain      = undef,
  $authuser           = undef,
  $authpass           = undef,
  $authmethod         = undef,
  $usetls             = undef,
  $usestarttls        = undef,
  $tlscert            = undef,
  $tlskey             = undef,
  $tls_ca_file        = undef,
  $tls_ca_dir         = undef,
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
  else {
    warning('The current operating system is not supported!')
  }
}
