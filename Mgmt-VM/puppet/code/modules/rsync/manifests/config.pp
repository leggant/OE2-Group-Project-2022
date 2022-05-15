class rsync::config {
 

file { '/etc/backup':
    ensure => 'directory',
    owner  => 'root',
    group  => 'bitstudent',
    mode   => '0750',
  }
 
file { '/etc/backup/restore':
        ensure => present,
        source => 'puppet:///modules/rsync/restore.sh',
        mode => '0775',
	}

file { "backup.cron":
    path    => "/etc/cron.hourly/backup.cron",
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => "0775",
    content => "* 2 * * * root /etc/backup/restore"
}

}


