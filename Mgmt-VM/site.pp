node 'db-b.foo.org.nz' {
    include sudo
    include ntp_service
    include mariadb
    package { 'vim': ensure => present }
}
node 'backup-b.foo.org.nz' {
    include sudo
    include ntp_service
    package { 'vim': ensure => present }
}
node 'app-b.foo.org.nz' {
    include sudo
    include ntp_service
    package { 'vim': ensure => present }
}
node 'mgmt-b.foo.org.nz' {
    include sudo
    include ntp_service
    include nagios
    package { 'vim': ensure => present }
}
