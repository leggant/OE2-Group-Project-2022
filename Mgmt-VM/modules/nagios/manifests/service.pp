class nagios::service {
	service { "nagios" :
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class["nagios::config"],
	}
}
