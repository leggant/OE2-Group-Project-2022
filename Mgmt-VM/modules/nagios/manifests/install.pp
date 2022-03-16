class nagios::install {
    package { "nagios3" :
	ensure => present,
	}
    package { "apache2-utils" :
	ensure => present
	}
}
