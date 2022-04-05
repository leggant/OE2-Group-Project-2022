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
}
