# Class: apache::ssl
#
# This class installs Apache SSL capabilities
#
# Parameters:
# - The $ssl_package name from the apache::params class
#
# Actions:
#   - Install Apache SSL capabilities
#
# Requires:
#
# Sample Usage:
#
class apache::ssl {

  include apache
  
  case $::osfamily {
    'redhat': {
      package { $apache::params::ssl_package:
        require => Package['httpd'],
      }
    }
    'debian': {
      a2mod { "ssl": ensure => present, }
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
