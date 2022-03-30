class nrpe::install {
    package { 'nagios-nrpe-server' : ensure => present}
}
