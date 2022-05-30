class nrpe::service
{
service { 'nagios-nrpe-server' :
                ensure => running,
                hasstatus => true,
                hasrestart => true,
                enable => true,
}
nagios_service {"disk-check":
        service_description => "Remote disk servers",
        hostgroup_name => "disk-servers",
        target => "/etc/nagios3/conf.d/ppt_services.cfg",
        check_command => "check_nrpe!check_hd",
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => "24x7",
        notification_interval => 30,
        notification_period => "24x7",
        notification_options => "w,u,c",
        contact_groups => "slackgroup",
        mode => '0644',
       }

nagios_service {"hosts-alive":
        service_description => "check hosts alive",
        hostgroup_name => "hosts-alive",
        target => "/etc/nagios3/conf.d/ppt_services.cfg",
        check_command => "check_nrpe!check_ping",
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => "24x7",
        notification_interval => 30,
        notification_period => "24x7",
        notification_options => "w,u,c",
        contact_groups => "slackgroup",
        mode => '0644',
       }

nagios_service {"users-online":
        service_description => "check users-login",
        hostgroup_name => "hosts-alive",
        target => "/etc/nagios3/conf.d/ppt_services.cfg",
        check_command => "check_nrpe!check_users",
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => "24x7",
        notification_interval => 30,
        notification_period => "24x7",
        notification_options => "w,u,c",
        contact_groups => "slackgroup",
        mode => '0644',
       }

nagios_service {"check_apache2":
        service_description => "check apache status",
        hostgroup_name => "owncloud-b",
        target => "/etc/nagios3/conf.d/ppt_services.cfg",
        check_command => "check_nrpe!check_apache2",
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => "24x7",
        notification_interval => 30,
        notification_period => "24x7",
        notification_options => "w,u,c",
        contact_groups => "slackgroup",
        mode => '0644',
       }

nagios_service {"check_owncloud":
        service_description => "check owncloud status",
        hostgroup_name => "check-owncloud-b",
        target => "/etc/nagios3/conf.d/ppt_services.cfg",
        check_command => "check_nrpe!check_owncloud",
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => "24x7",
        notification_interval => 30,
        notification_period => "24x7",
        notification_options => "w,u,c",
        contact_groups => "slackgroup",
        mode => '0644',
       }

nagios_service {"check_nagios":
        service_description => "check nagios alive",
        hostgroup_name => "mgmt-b",
        target => "/etc/nagios3/conf.d/ppt_services.cfg",
        check_command => "check_nrpe!check_nagios",
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => "24x7",
        notification_interval => 30,
        notification_period => "24x7",
        notification_options => "w,u,c",
        contact_groups => "slackgroup",
        mode => '0644',
       }

nagios_service {"check_puppet_master":
        service_description => "check puppet-master",
        hostgroup_name => "mgmt-b",
        target => "/etc/nagios3/conf.d/ppt_services.cfg",
        check_command => "check_nrpe!check_puppet_master",
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => "24x7",
        notification_interval => 30,
        notification_period => "24x7",
        notification_options => "w,u,c",
        contact_groups => "slackgroup",
        mode => '0644',
       }
}
