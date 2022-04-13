#!/bin/sh
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo apt install php7.3 libapache2-mod-php7.3 php7.3-common
sudo apt install php7.3-mbstring php7.3-xmlrpc php7.3-soap php7.3-apcu
sudo apt install php7.3-smbclient php7.3-ldap php7.3-redis php7.3-gd php7.3-xml
sudo apt install php7.3-intl php7.3-json php7.3-imagick php7.3-zip 
sudo apt install php7.3-mysql php7.3-curl
php -v
sudo update-alternatives --config 
