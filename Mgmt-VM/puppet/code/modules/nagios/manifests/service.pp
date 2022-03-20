class nagios::service {
	service { 'nagios3' :
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class["nagios::config"],
	}

}
