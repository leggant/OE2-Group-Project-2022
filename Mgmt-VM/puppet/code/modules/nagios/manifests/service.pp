class nagios::service {
	service { 'nagios3' :
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class["nagios::config"],
	}
	nagios_service {"ssh":
	service_description => "ssh servers",
	hostgroup_name => "my-ssh-servers",
	target => "/etc/nagios3/conf.d/ppt_services.cfg",
	check_command => "check_ssh",
	max_check_attempts => 3,
	retry_check_interval => 1,
	normal_check_interval => 5,
	check_period => "24x7",
	notification_interval => 30,
	notification_period => "24x7",
	notification_options => "w,u,c",
	contact_groups => "slackgroup",
	mode => '0444',
	}

	nagios_service {"db":
        service_description => "MariaDB servers",
        hostgroup_name => "my-db-servers",
        target => "/etc/nagios3/conf.d/ppt_services.cfg",
        check_command => "check_mysql_cmdlinecred!nagios!Oe2b2022",
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => "24x7",
        notification_interval => 30,
        notification_period => "24x7",
        notification_options => "w,u,c",
	contact_groups => "slackgroup",
	mode => '0444',
        }
}
