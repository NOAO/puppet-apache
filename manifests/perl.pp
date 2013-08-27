# Class: apache::perl
#
# This class installs mod_perl 
#
# Parameters:
# - The $ssl_package name from the apache::params class
#
# Actions:
#   - Install mod_perl
#
# Requires:
#
# Sample Usage:
#
class apache::perl {

  include apache
  
  case $::osfamily {
    'redhat': {
      package { $apache::params::perl_package:
        require => Package['httpd'],
      }
    }
    'debian': {
      a2mod { "perl": ensure => present, }
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
