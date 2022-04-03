class nrpe::config{
   file { '/etc/nagios/nrpe.cfg':
        source => 'puppet:///modules/nrpe/nrpe.cfg',
        ensure => present,
        group => 'nagios',
	mode => '0644'
        }
  
	nagios_hostgroup {"disk-servers":
        target => "/etc/nagios3/conf.d/ppt_hostgroups.cfg",
        mode => "0444",
        alias => 'My remote disk servers',
        members => 'backup-b.foo.org.nz,db-b.foo.org.nz, app-b.foo.org.nz'
        }
}


