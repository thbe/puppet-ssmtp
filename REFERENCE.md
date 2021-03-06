# Reference
<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

**Classes**

* [`ssmtp`](#ssmtp): Class: ssmtp ===========================  This class manage local ssmtp installation  Parameters ----------  [*default_mta*] Boolean. If set 
* [`ssmtp::config`](#ssmtpconfig): Class: ssmtp::config  This module contain the configuration for sSMTP  Parameters:   This module has no parameters  Actions:      This module
* [`ssmtp::package`](#ssmtppackage): Class: ssmtp::package  This module contain the service configuration for sSMTP  Parameters:   This module has no parameters  Actions:      Th
* [`ssmtp::params`](#ssmtpparams): Class: ssmtp::params  This class contain the parameters for sSMTP  Parameters:  This module has no parameters  Actions:  This module has no a
* [`ssmtp::service`](#ssmtpservice): Class: ssmtp::service  This module contain the service configuration for sSMTP  Parameters:   This module has no parameters  Actions:      Th

## Classes

### ssmtp

Class: ssmtp
===========================

This class manage local ssmtp installation

Parameters
----------

[*default_mta*]
Boolean. If set to ssmtp, ssmtp will be set as default mta
Default: false
Valid values: true, false

[*root_email*]
 Mail address that get root mails

* `mail_hub`
 Server that is used for outgoing mail

* `from_line_override` (default=YES)
 Allow mail client to override from line

* `revaliases`
 Array of reverse aliases

* `hostname`
 Override ssmtp.conf parameter, see man 5 ssmtp.conf

* `rewritedomain`
 Override ssmtp.conf parameter, see man 5 ssmtp.conf

* `authuser`
 Override ssmtp.conf parameter, see man 5 ssmtp.conf

* `authpass`
 Override ssmtp.conf parameter, see man 5 ssmtp.conf

* `authmethod`
 Override ssmtp.conf parameter, see man 5 ssmtp.conf

* `tlscert`
 Override ssmtp.conf parameter, see man 5 ssmtp.conf

* `tlskey`
 Override ssmtp.conf parameter, see man 5 ssmtp.conf

* `authuser`
 Override ssmtp.conf parameter, see man 5 ssmtp.conf

* `tlscafile`
 Override ssmtp.conf parameter, see man 5 ssmtp.conf

* `tlscadir`
 Override ssmtp.conf parameter, see man 5 ssmtp.conf

* `require_yum` (bool, default=true)
 Override ssmtp.conf parameter, see man 5 ssmtp.conf

Variables
----------

* `osfamily`
 This variable is used to determin if module can be used on current operating
 system or not

Examples
--------

Authors
-------

Thomas Bendler <project@bendler-net.de>
Thomas Mueller <mueller@puzzle.ch>

Copyright
---------

Copyright 2017 Thomas Bendler, unless otherwise noted.

#### Examples

##### 

```puppet
class { '::ssmtp':
  mail_hub   => 'mail.example.local',
  root_email => 'john.doe@example.local',
}
```

#### Parameters

The following parameters are available in the `ssmtp` class.

##### `default_mta`

Data type: `Any`



Default value: $ssmtp::params::default_mta

##### `root_email`

Data type: `Any`



Default value: $ssmtp::params::root_email

##### `mail_hub`

Data type: `Any`



Default value: $ssmtp::params::mail_hub

##### `revaliases`

Data type: `Any`



Default value: $ssmtp::params::revaliases

##### `from_line_override`

Data type: `Any`



Default value: $ssmtp::params::from_line_override

##### `hostname`

Data type: `Any`



Default value: `undef`

##### `rewritedomain`

Data type: `Any`



Default value: `undef`

##### `authuser`

Data type: `Any`



Default value: `undef`

##### `authpass`

Data type: `Any`



Default value: `undef`

##### `authmethod`

Data type: `Any`



Default value: `undef`

##### `usetls`

Data type: `Any`



Default value: `undef`

##### `usestarttls`

Data type: `Any`



Default value: `undef`

##### `tlscert`

Data type: `Any`



Default value: `undef`

##### `tlskey`

Data type: `Any`



Default value: `undef`

##### `tlscafile`

Data type: `Any`



Default value: `undef`

##### `tlscadir`

Data type: `Any`



Default value: `undef`

##### `ssmtp_conf_mode`

Data type: `Any`



Default value: $ssmtp::params::ssmtp_conf_mode

##### `ssmtp_conf_owner`

Data type: `Any`



Default value: $ssmtp::params::ssmtp_conf_owner

##### `ssmtp_conf_group`

Data type: `Any`



Default value: $ssmtp::params::ssmtp_conf_group

##### `revaliases_conf_mode`

Data type: `Any`



Default value: $ssmtp::params::revaliases_conf_mode

##### `revaliases_conf_owner`

Data type: `Any`



Default value: $ssmtp::params::revaliases_conf_owner

##### `revaliases_conf_group`

Data type: `Any`



Default value: $ssmtp::params::revaliases_conf_group

### ssmtp::config

Class: ssmtp::config

This module contain the configuration for sSMTP

Parameters:   This module has no parameters

Actions:      This module has no actions

Requires:     This module has no requirements

Sample Usage: include ssmtp::config

### ssmtp::package

Class: ssmtp::package

This module contain the service configuration for sSMTP

Parameters:   This module has no parameters

Actions:      This module has no actions

Requires:     This module has no requirements

Sample Usage: include ssmtp::package

### ssmtp::params

Class: ssmtp::params

This class contain the parameters for sSMTP

Parameters:
 This module has no parameters

Actions:
 This module has no actions

Requires:
 This module has no requirements

Sample Usage:
 include ssmtp::params

### ssmtp::service

Class: ssmtp::service

This module contain the service configuration for sSMTP

Parameters:   This module has no parameters

Actions:      This module has no actions

Requires:     This module has no requirements

Sample Usage: include ssmtp::service

