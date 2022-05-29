class rsync::config {
file { '/etc/backup':
    ensure => 'directory',
    owner  => 'root',
    group  => 'bitstudent',
    mode   => '0750',
  }
file { '/etc/rsyncd.conf':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
 } 
file { '/etc/backup/restore.sh':
        ensure => present,
        source => 'puppet:///modules/rsync/restore.sh',
        mode => '0775',
}

file { '/etc/backup/daily.sh':
        ensure => present,
        source => 'puppet:///modules/rsync/daily.sh',
        mode => '0775',
}

file { '/etc/backup/weekly.sh':
        ensure => present,
        source => 'puppet:///modules/rsync/weekly.sh',
        mode => '0775',
}
file { '/home/bitstudent/rsync.log':
        ensure => present,
        source => 'puppet:///modules/rsync/rsync.log',
        mode => '0770',
	group => 'bitstudent',
        owner => 'bitstudent',
}
file { '/home/bitstudent/daily.log':
        ensure => present,
        source => 'puppet:///modules/rsync/daily.log',
        mode => '0770',
	group => 'bitstudent',
        owner => 'bitstudent',
}
file { '/home/bitstudent/weekly.log':
        ensure => present,
        source => 'puppet:///modules/rsync/weekly.log',
        mode => '0770',
	group => 'bitstudent',
	owner => 'bitstudent',
}
}


