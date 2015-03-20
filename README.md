# dnsupdate #

[![Puppet Forge](https://img.shields.io/badge/puppetforge-0.1.0-blue.svg)](https://forge.puppetlabs.com/swizzley88/dnsupdate)

**Table of Contents**

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
4. [Usage](#usage)
5. [Requirements](#requirements)
6. [Compatibility](#compatibility)
7. [Limitations](#limitations)
8. [Development](#development)

## Overview ##

This is the dnsupdate module. It uses nsupdate included with bind-utils to manage DNS records.

## Module Description ##

This module will delete invalid A records, and create valid A records with a matching PTR in Microsoft Active Directory Integrated DNS. It checks to make sure the bind-utils package is installed and creates a nsupdate file /etc/nsupdate which is formed from template using facter in for an nsupdate script. It then queuries DNS using nslookup to match PTR and A records, if either don't match, it runs.   

## Setup ##

You may need to configure AD DNS security to allow the zone updates.

## Usage ##

```include dnsupdate```

## Requirements ##

puppetlabs/stdlib >= 4.2.0 

## Compatibility ##

  - RHEL 5, 6, 7
  - CentOS 6, 7
  - Oracle Enterprise Linux 5, 6, 7
  - Fedora 18, 19, 20, 21


## Limitations ##

This module has been tested on:

Server: 
  - Microsoft Windows Server 2008 R2 

Client: 
  - RHEL 7
  - CentOS 6
  - CentOS 5
  - Oracle Enterprise Linux 6

## Development ##

Contributions:
  - John Richards <jrichards03@gmail.com> (MOD) original bash service script this module was based on
  - Justin Dossey <justin.dossey@newcontext.com> (New Context) for the elegant sed
  - TomyWork (IRC #puppet) for the helping me figure out the operator and shell provider for unless 

###### Contact ######

Email:  morgan@aspendenver.org

WWW:    www.aspendenver.org

Github: https://github.com/swizzley

