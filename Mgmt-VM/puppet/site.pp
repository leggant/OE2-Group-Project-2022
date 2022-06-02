node 'db-b.foo.org.nz' {
    include sudo
    include ntp_service
    include mariadb
    include rsync    
    include nrpe_nagios
    service { 'rsyslog': ensure => 'running', enable => true }
    service { 'puppet': ensure => 'running', enable => true }
    package { 'vim': ensure => present }
}
node 'backup-b.foo.org.nz' {
    include sudo
    include rsync
    include nrpe_nagios
    include ntp_service
    service { 'puppet': ensure => 'running', enable => true }
    service { 'rsyslog': ensure => 'running', enable => true }
    package { 'vim': ensure => present }
}
node 'app-b.foo.org.nz' {
    include sudo
    include rsync
    include ntp_service
    include nrpe_nagios
    service { 'puppet': ensure => 'running', enable => true }
    package { 'vim': ensure => present }
    package { 'mysql-server': ensure => present }
    service { 'mysql': ensure => 'running' }
    service { 'rsyslog': ensure => 'running', enable => true }
    include php
}
node 'mgmt-b.foo.org.nz' {
    include sudo
    include nrpe
    include rsync
    include ntp_service
    include nagios
    service { 'rsyslog': ensure => 'running', enable => true }
    package { 'vim': ensure => present }
}
