class nrpe_nagios::config{ 

 file { '/etc/nagios/nrpe.cfg':
        ensure => present,
        group => 'nagios',
        source => 'puppet:///modules/nrpe/nrpe.cfg',
        mode => '0777',
     }
}
