# @summary This class contain the packages for ssmtp module
# @example include ssmtp::package
#
class ssmtp::package {
  package { $ssmtp::params::package_ssmtp: ensure => installed; }
}
