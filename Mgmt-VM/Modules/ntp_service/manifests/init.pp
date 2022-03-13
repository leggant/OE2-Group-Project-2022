class ntp_service {
include install, config, service
}
class install {
   package { 'ntp':
   	ensure => present,
  }
}
class config {
if $hostname == 'mgmt-b' {
	$restrict = 'restrict 10.6.0.0 mask 255.255.255.0 nomodify notrap'
	$server = 'server 127.127.1.0'
	$fudge = '127.127.1.0 stratum 10'
} else {
	$restrict = ''
	$server = 'server mgmt-b.foo.org.nz prefer'
	$fudge = ''
}
	file { '/etc/ntp.conf':
		ensure => present,
		owner => 'root',
		group => 'root',
		mode => '0444',
		content => template('ntp_service/ntp.conf.erb'),
	}
}
class service {
	service { 'ntp':
		ensure => running,
		enable => true,
	}
}
