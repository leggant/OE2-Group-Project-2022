class nrpe::config {
file { '/etc/nagios3/nrpe.cfg':
        ensure => present,
	owner => 'root',
	source => 'puppet:///modules/nrpe/nrpe.cfg',
	group => 'root',
	mode => '0777',
}
nagios_hostgroup {"disk-servers":
        target => "/etc/nagios3/conf.d/ppt_hostgroups.cfg",
        mode => "0777",
        alias => 'My remote disk servers',
        members => 'backup-b.foo.org.nz,db-b.foo.org.nz,app-b.foo.org.nz',
        }
}


