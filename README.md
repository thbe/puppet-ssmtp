# ssmtp

[![Build Status](https://travis-ci.org/thbe/puppet-ssmtp.png?branch=master)](https://travis-ci.org/thbe/puppet-ssmtp)
[![Puppet Forge](https://img.shields.io/puppetforge/v/thbe/ssmtp.svg)](https://forge.puppetlabs.com/thbe/ssmtp)
[![Coverage Status](https://coveralls.io/repos/thbe/puppet-ssmtp/badge.svg?branch=master&service=github)](https://coveralls.io/github/thbe/puppet-ssmtp?branch=master)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with ssmtp](#setup)
    * [What ssmtp affects](#what-ssmtp-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ssmtp](#beginning-with-ssmtp)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)


## Overview

The ssmtp module provides the installation procedure for SSMTP including the setup of
the alternate system if not overwritten by class parameter.

## Module Description

The SSMTP module prelace the standard mail server configuration with a light
wight sending only server. The behavior is the same as sendmail but without
the possibility to recieve mails from external systems.


## Setup

### What ssmtp affects

* ssmtp package.
* ssmtp configuration file.
* ssmtp alternative service configuration.

### Setup requirements

You need to activate the EPEL repository before you can setup the SSMTP instance.
If you use a rpm based system from the RedHat family you can use my yum module (thbe-yum):

```puppet
class { "::yum": repo_epel => true }
```

### Beginning with ssmtp

include '::ssmtp' is enough to get you up and running if the parameters point to
proper values.  If you wish to pass in parameters like which servers to use then you
can use:

```puppet
class { '::ssmtp':
  mail_hub => 'mail.example.local',
}
```

## Usage

All interaction with the ssmtp module can do be done through the main ssmtp class.
This means you can simply toggle the options in the ssmtp class to get at the full
functionality.

### I just want SSMTP, what's the minimum I need?

```puppet
include '::ssmtp'
```

### I just want to route all mails to central mail gateway, nothing else.

```puppet
class { '::ssmtp':
  mail_hub => 'mail.example.local',
  root_email => 'john.doe@example.local',
}
```

## Reference

See [https://github.com/thbe/puppet-ssmtp/blob/master/REFERENCE.md](https://github.com/thbe/puppet-ssmtp/blob/master/REFERENCE.md)

## Limitations

This module has been built on and tested against Puppet 5 and higher.

The module has been tested on:

* CentOS 7
* Debian 9
* Ubuntu 18.04

Testing on other platforms has been light and cannot be guaranteed.

## Development

If you like to add or improve this module, feel free to fork the module and send
me a merge request with the modification.

### Contributors

The list of contributors can be found at: [https://github.com/thbe/puppet-ssmtp/graphs/contributors](https://github.com/thbe/puppet-ssmtp/graphs/contributors)
