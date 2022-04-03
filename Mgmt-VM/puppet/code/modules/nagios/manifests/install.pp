class nagios::install {
    package { 'nagios3' : ensure => present}
    package{ 'apache2-utils' : ensure => present}
    package { 'libwww-perl' : ensure => present  }
    package { 'libcrypt-ssleay-perl' : ensure => present }
}
