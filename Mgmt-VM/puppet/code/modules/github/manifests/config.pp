class github::config {
    file { '/etc/mysql/mariadb.conf.d/50-server.cnf':
      ensure => present,
    #   source => 'puppet:///modules/mariadb/50-server.cnf',
      mode => '0444',
      owner => 'bitstudent',
      group => 'bitstudent',
      require => Class['github::install'],
      notify => Class['github::service'],
	} 
}
