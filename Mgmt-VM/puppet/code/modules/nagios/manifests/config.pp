class nagios::config {
	file { '/etc/nagios3/nagios.cfg':
                ensure => present,
                mode => '0644',
                owner => 'root',
                source => 'puppet:///modules/nagios/nagios.cfg',
                group => 'www-data',
                require => Class['nagios::install'],
                notify => Class['nagios::service'],
	}

        file { '/etc/nagios3/htpasswd.users':
        source => 'puppet:///modules/nagios/htpasswd.users',
        ensure => present,
        group => 'www-data',
        }
	
	file { '/etc/nagios3/conf.d':
        ensure => directory,
        mode => '0775',
        owner => 'root',
        group => 'puppet',
        }

	file { '/etc/nagios3/conf.d/ppt_contacts.cfg':
		ensure => present,
		mode => '0444',
	}

	file { '/etc/nagios3/conf.d/ppt_contactgroups.cfg':
		ensure => present,
		mode => '0444',
	}

	nagios_contact { 'slack-anthony':
		target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
		alias => 'Slack Anthony',
		service_notification_period => '24x7',
		host_notification_period => '24x7',
		service_notification_options => 'w,u,c,r',
		host_notification_options => 'd,r',
		service_notification_commands => 'notify-service-by-slack',
		host_notification_commands => 'notify-host-by-slack',
		email => 'leggtc1@student.op.ac.nz',
	}
        nagios_contact { 'slack-mohammed':
                target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
                alias => 'Slack Mohammed',
                service_notification_period => '24x7',
                host_notification_period => '24x7',
                service_notification_options => 'w,u,c,r',
                host_notification_options => 'd,r',
                service_notification_commands => 'notify-service-by-slack',
                host_notification_commands => 'notify-host-by-slack',
                email => 'alhama2@student.op.ac.nz',
        }
	nagios_contact { 'slack':
                target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
                alias => 'Slack',
                service_notification_period => '24x7',
                host_notification_period => '24x7',
                service_notification_options => 'w,u,c,r',
                host_notification_options => 'd,r',
                service_notification_commands => 'notify-service-by-slack',
                host_notification_commands => 'notify-host-by-slack',
        }
	nagios_contactgroup { 'slackgroup':
		target => '/etc/nagios3/conf.d/ppt_contactgroups.cfg',
		alias => 'Slack channel',
		members => 'slack-anthony, slack-mohammed, slack',
	}
	nagios_host { 'db-b.foo.org.nz':
        target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
	alias => 'db',
	check_period => '24x7',
	max_check_attempts => 3,
	check_command => 'check-host-alive',
	notification_interval => 10,
	notification_period => '24x7',
	notification_options => 'd,u,r',
	mode => '0644',
	contact_groups => 'slackgroup',
	}	

#	nagios_host { 'app-b.foo.org.nz':
#        target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
#        alias => 'app',
#        check_period => '24x7',
#        max_check_attempts => 3,
#        check_command => 'check-host-alive',
#        notification_interval => 10,
 #       notification_period => '24x7',
 #       notification_options => 'd,u,r',
 #       mode => '0444',
#	contact_groups => 'slackgroup',
#	}
	nagios_host { 'backup-b.foo.org.nz':
        target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
        alias => 'backup',
        check_period => '24x7',
        max_check_attempts => 3,
        check_command => 'check-host-alive',
        notification_interval => 10,
        notification_period => '24x7',
        notification_options => 'd,u,r',
        mode => '0444',
	contact_groups => 'slackgroup',
	}

	nagios_host { 'mgmt-b.foo.org.nz':
        target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
        alias => 'mgmt',
        check_period => '24x7',
        max_check_attempts => 3,
        check_command => 'check-host-alive',
        notification_interval => 10,
        notification_period => '24x7',
        notification_options => 'd,u,r',
        mode => '0444',
	contact_groups => 'slackgroup',
	}

	nagios_hostgroup {"my-ssh-servers":
	target => "/etc/nagios3/conf.d/ppt_hostgroups.cfg",
	mode => "0444",
	alias => 'My SSH servers',
	members => 'backup-b.foo.org.nz, mgmt-b.foo.org.nz, db-b.foo.org.nz, app-b.foo.org.nz'
	}

	nagios_hostgroup {"my-db-servers":
        target => "/etc/nagios3/conf.d/ppt_hostgroups.cfg",
        mode => "0444",
        alias => 'My DB servers',
        members => 'db-b.foo.org.nz'
        }	
}
