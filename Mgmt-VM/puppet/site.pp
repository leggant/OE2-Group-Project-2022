node 'db-b.foo.org.nz' {
    include sudo
    include ntp_service
    include mariadb
    include nrpe_nagios
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
    include ntp_service
    service { 'puppet': ensure => 'running', enable => true }
    package { 'vim': ensure => present }
    package { 'mysql-server': ensure => present }
    service { 'mysql': ensure => 'running' }

}
node 'mgmt-b.foo.org.nz' {
    include sudo
    include nrpe 
    include ntp_service
    include nagios
    package { 'vim': ensure => present }
}
