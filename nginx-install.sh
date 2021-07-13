#!/bin/bash
# Instalacion NGinx PHP MariaDB y WordPress

apt update
apt full-upgrade -y
apt update
apt upgrade -y
apt autoremove -y

sudo apt install nginx -y
sudo apt update
sudo apt upgrade -y 

cd /etc/nginx/sites-available
cp default proba1.com 
cp default proba2.com

cd /etc/nginx/sites-enabled
ln -s ../sites-available/proba1 .
ln -s ../sites-available/proba2 .
nginx -s reload

cd /var/www
mkdir proba1
mkdir proba2

apt install php-fpm

nginx -t 
systemctl reload nginx

apt install mariadb-server mariadb-client -y
cd /tmp
wget https://files.phpmyadmin.net/phpMyAdmin/5.1.1/phpMyAdmin-5.1.1-all-languages.tar.gz
apt install unzip -y
unzip phpMyAdmin-5.1.1-all-languages.tar.gz
mv phpMyAdmin-5.1.1-all-languages /var/www/proba1/phpMyAdmin

apt install php php php-common php-cli php-fpm php-opcache php-gd php-mysql php-curl php-intl php-xsl php-mbstring php-zip php-bcmath php-soap -y
apt install php-xmlrpc php-xml php-mcrypt php-ldap -y

cd /tmp
wget https://wordpress.org/latest.tar.gz
tar xvzf latest.tar.gz 
mv wordpress/* /var/www/proba1/
chown -R www-data:www-data /var/www/proba1
sudo find /var/www/proba1 -type d -exec chmod 0755 {} \;
sudo find /var/www/proba1 -type f -exec chmod 0644 {} \;

cd /var/www/proba1
sudo mv wp-config-sample.php wp-config.php