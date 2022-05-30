class nodeexporter::config {
file { '/etc/systemd/system/node-exporter.service':
        ensure => present,
        group => 'root',
	source => 'puppet:///modules/node_exporter/node-exporter.service',
        mode => '0644',
	}
file { '/etc/node_exporter':
        ensure => directory,
        group => 'root',
        source => 'puppet:///modules/node_exporter/node_exporter',
        mode => '0644',
        }
}
