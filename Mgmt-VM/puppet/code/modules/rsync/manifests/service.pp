class rsync::service {
	service { 'rsync.service':
		ensure => running,
		hasrestart => true,
		enable => true,
		hasstatus => false,
	}
}
