#!/bin/sh
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo apt install php7.3 libapache2-mod-php7.3 php7.3-common
sudo apt install php7.3-mbstring php7.3-xmlrpc php7.3-soap php7.3-apcu
sudo apt install php7.3-smbclient php7.3-ldap php7.3-redis php7.3-gd php7.3-xml
sudo apt install php7.3-intl php7.3-json php7.3-imagick php7.3-zip 
sudo apt install php7.3-mysql php7.3-curl
php -v
sudo update-alternatives --set php /usr/bin/php7.3 
sudo apt install apache2
sudo ufw app list
sudo ufw app info "Apache Full"
sudo systemctl restart apache2

# Add Repo Step Goes Here

echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/server:/10/Ubuntu_18.04/ /' | sudo tee /etc/apt/sources.list.d/isv:ownCloud:server:10.list
curl -fsSL https://download.opensuse.org/repositories/isv:ownCloud:server:10/Ubuntu_18.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/isv_ownCloud_server_10.gpg >/dev/null
sudo apt update
sudo apt install owncloud-complete-files

# Configure Apache
sudo cp  ~/OE2-Group-Project/Scripts/app/owncloud.conf /etc/apache2/sites-available/
sudo sed -i "s#html#owncloud#" /etc/apache2/sites-available/000-default.conf
sudo a2ensite owncloud
sudo a2enmod dir env headers mime rewrite setenvif
# Restart apache and check it is running
sudo systemctl restart apache2
sudo systemctl status apache2

sudo apt install mysql-server
sudo systemctl status mysql-server
sudo apache2ctl configtest
sudo systemctl reload apache2
