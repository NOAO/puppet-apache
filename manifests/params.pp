# Class: apache::params
#
# This class manages Apache parameters
#
# Parameters:
# - The $user that Apache runs as
# - The $group that Apache runs as
# - The $apache_name is the name of the package and service on the relevant distribution
# - The $php_package is the name of the package that provided PHP
# - The $ssl_package is the name of the Apache SSL package
# - The $perl_package is the name of the Apache Perl package
# - The $apache_dev is the name of the Apache development libraries package
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class apache::params {

  case $::osfamily {
    'redhat': {
       $user         = 'apache'
       $group        = 'apache'
       $apache_name  = 'httpd'
       $php_package  = 'php'
       $ssl_package  = 'mod_ssl'
       $perl_package = 'mod_perl'
       $apache_dev   = 'httpd-devel'
       $vdir         = '/etc/httpd/conf.d/'
    }
    'debian': {
       $user         = 'www-data'
       $group        = 'www-data'
       $apache_name  = 'apache2'
       $php_package  = 'libapache2-mod-php5'
       $ssl_package  = 'apache-ssl'
       $perl_package = 'apache-perl'
       $apache_dev   = [ 'libaprutil1-dev', 'libapr1-dev', 'apache2-prefork-dev' ]
       $vdir         = '/etc/apache2/sites-enabled/'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }

}
