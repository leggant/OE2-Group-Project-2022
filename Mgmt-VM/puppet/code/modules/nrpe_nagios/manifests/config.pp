class nrpe_nagios::config{ 

 file { '/etc/nagios/nrpe.cfg':
        ensure => present,
        group => 'nagios',
        source => 'puppet:///modules/nrpe/nrpe.cfg',
        mode => '0777',
     }


 file { '/etc/nagios-plugins/config/check_service.sh':
        ensure => present,
        group => 'nagios',
        source => 'puppet:///modules/nrpe/check_service.sh',
        mode => '0777',
     }
}
