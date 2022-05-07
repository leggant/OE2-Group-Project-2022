class ntp_service {
include install, config, service
}
class install {
   package { 'ntp':
        ensure => present,
  }
}
class config {
    		file { '/etc/heloooo/ntp.conf':            
		ensure => present,
                owner => 'root',
                group => 'root',
                mode => '0444',
        }
}

class service {
        service { 'ntp':
                ensure => running,
                enable => true,
        }
}
   


