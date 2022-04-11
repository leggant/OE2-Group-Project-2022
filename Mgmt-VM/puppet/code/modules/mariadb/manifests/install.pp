class mariadb::install {
    package { 'mariadb-server' :
              ensure => present,
              require => User['mysql'],
    }
    package {'mysql-client':
	ensure => installed,
    }
    user { 'mysql':
           ensure => present,
           comment => 'MariaDB user',
           gid => 'mysql',
           shell => '/bin/false',
           require => Group['mysql'],
    }
    group { 'mysql' :
            ensure => present,
	} 
}
