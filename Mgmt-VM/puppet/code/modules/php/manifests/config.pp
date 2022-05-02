class php::config {
	exec {'add-php-package':
		command => 'sudo add-apt-repository ppa:ondrej/php -y',
		provider => shell,
	}
}
