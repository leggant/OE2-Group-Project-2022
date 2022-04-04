node 'db-b.foo.org.nz' {
    include sudo
    include ntp_service
    include mariadb
    service { 'puppet': ensure => 'running', enable => true }
    package { 'vim': ensure => present }
}
node 'backup-b.foo.org.nz' {
    include sudo
    include ntp_service
    service { 'puppet': ensure => 'running', enable => true }
    package { 'vim': ensure => present }
}
node 'app-b.foo.org.nz' {
    include sudo
    include nrpe_nagios
    include ntp_service
    service { 'puppet': ensure => 'running', enable => true }
    package { 'vim': ensure => present }
}
node 'mgmt-b.foo.org.nz' {
    include sudo
    include ntp_service
    include nrpe
    include nagios
    package { 'vim': ensure => present }
}
