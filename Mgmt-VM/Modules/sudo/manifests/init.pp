class sudo {
  package { 'sudo':
      ensure => present,
  }
  file { '/etc/sudoers':
      owner => 'root',
      group => 'root',
      mode => '0444',
      source => 'puppet:///modules/sudo/etc/sudoers',
      require => Package['sudo'],
  } 
}
