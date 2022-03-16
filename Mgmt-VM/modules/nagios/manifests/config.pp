class nagios::config {
    file { '/etc/nagios3/nagios.cfg':
      ensure => present,
      source => 'puppet:///modules/nagios3/nagios.cfg',
      mode => '0644',
      owner => 'root',
      group => 'www-data',
      require => Class['nagios::install'],
      notify => Class['nagios::service'],
}
file { '/etc/puppet/code/modules/nagios/files/htpasswd.users':
	ensure => present,
}

