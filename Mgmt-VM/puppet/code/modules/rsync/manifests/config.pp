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
    path    => "/etc/cron.d/backup.cron",
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => "0775",
    content => "* * * * * root cd /etc/backup/ && bash restore"
}

}


