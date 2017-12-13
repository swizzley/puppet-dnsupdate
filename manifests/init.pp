# Class: dnsupdate
#
# This module manages PTR, and A records in AD DNS
#
# Parameters: none
#
# Actions:
# It makes sure bind-utils is installed which has the nsupdate binary.
# It makes a file /etc/nsupdate used for pushing updates and for
# verifying that updates need to be made by queuring DNS first.
#
# Requires: stdlib
#
# Sample Usage: include ::dnsupdate
#
class dnsupdate {
  # Package
  case $facts['os']['family'] {
    'RedHat': {
      if ! defined(Package['bind-utils']) {
        package { 'bind-utils':
          ensure => installed,
        }
      }
    }
    'Debian': {
      if ! defined(Package['dnsutils']) {
        package { 'dnsutils':
          ensure => installed,
        }
      }
    }
  }
  # Update
  file { '/etc/nsupdate':
    ensure  => 'present',
    content => template('dnsupdate/nsupdate.erb')
  } ->
  exec { 'nsupdate':
    path     => ['/bin', '/usr/bin'],
    command  => 'nsupdate /etc/nsupdate',
    provider => 'shell',
    unless   => "grep $(nslookup $(hostname -f) |sed -n '/^Name/{n;s/.*: //p}') /etc/nsupdate && grep $(nslookup $(hostname -i)|egrep -o '^[0-9]+.[0-9]+.[0-9]+.[0-9]+') /etc/nsupdate",
    require  => Package['bind-utils'],
  }
}
