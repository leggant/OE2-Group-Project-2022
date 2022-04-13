class php::install {
	require => Class["php::config"],
	package { 'exif' : ensure => present }
	package { 'php7.3' : ensure => present }
	package { 'libapache2-mod-php7.3' : ensure => present }
	package { 'php7.3-common' : ensure => present}
	package { 'php7.3-mbstring' : ensure => present}
	package { 'php7.3-xmlrpc' : ensure => present}
	package { 'php7.3-soap' : ensure => present}
	package { 'php7.3-apcu' : ensure => present}
	package { 'php7.3-smbclient' : ensure => present}
	package { 'php7.3-ldap' : ensure => present}
	package { 'php7.3-redis' : ensure => present}
	package { 'php7.3-gd' : ensure => present}
	package { 'php7.3-xml' : ensure => present}
	package { 'php7.3-intl' : ensure => present}
	package { 'php7.3-json' : ensure => present}
	package { 'php7.3-imagick' : ensure => present}
	package { 'php7.3-zip' : ensure => present}
	package { 'php7.3-mysql' : ensure => present}
	package { 'php7.3-curl' : ensure => present}
}
