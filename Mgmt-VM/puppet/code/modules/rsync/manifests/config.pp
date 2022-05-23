class rsync::config {
file { '/etc/backup':
    ensure => 'directory',
    owner  => 'root',
    group  => 'bitstudent',
    mode   => '0750',
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
}


