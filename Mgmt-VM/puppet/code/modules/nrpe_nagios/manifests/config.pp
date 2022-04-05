class nrpe_nagios::config{
   
	file { '/etc/test/nrpe.cfg':
	        source => '/etc/nagios/nrpe.cfg',
	        ensure => present,
	        group => 'nagios',
		mode => '0644'
        }
}
