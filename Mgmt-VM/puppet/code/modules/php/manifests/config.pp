class php::config {
	#exec {'add-php-package':
	#	command => 'sudo add-apt-repository ppa:ondrej/php -y',
	#	provider => 'shell',
	#}
	Exec { 'update':
		command => 'sudo apt-get update',
                provider => shell,
	}
}
