#!/bin/bash

service nginx start 
service mysql start 
service php7.3-fpm start 

#########  install wordpress
wget -c https://wordpress.org/latest.tar.gz -O - | tar -xz -C /var/www
chown -R www-data: /var/www/wordpress      #allow webserver complete access

#######  install phpmyadmin
wget -c https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-english.tar.gz -O - | tar -xz -C /var/www
mv var/www/phpMyAdmin-4.9.2-english var/www/phpmyadmin

service php7.3-fpm restart

####### configure nginx for wordpress and phpmyadmin

cp srcs_docker/nginx-block /etc/nginx/sites-available/nginx-block

ln -s /etc/nginx/sites-available/nginx-block  /etc/nginx/sites-enabled/nginx-block
rm /etc/nginx/sites-enabled/default

service php7.3-fpm restart
service nginx restart

mysql < srcs_docker/create_db.sql

/bin/sh