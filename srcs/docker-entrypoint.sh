#!/bin/bash

service nginx start 
service mysql start 
service php7.3-fpm start 

#########  install wordpress
wget -c https://wordpress.org/latest.tar.gz -O - | tar -xz -C /var/www
chown -R www-data: /var/www/wordpress      #allow nginx complete access

#######  install phpmyadmin
wget -c https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-english.tar.gz -O - | tar -xz -C /var/www
mv var/www/phpMyAdmin-4.9.2-english var/www/phpmyadmin
# chown -R www-data: /var/www/phpadmin      #allow nginx complete access

service php7.3-fpm restart

####### configure nginx for wordpress and phpmyadmin

cp srcs_docker/nginx-block /etc/nginx/sites-available/nginx-block

ln -s /etc/nginx/sites-available/nginx-block  /etc/nginx/sites-enabled/nginx-block
rm /etc/nginx/sites-enabled/default

service php7.3-fpm restart
service nginx restart

mysql < srcs_docker/create_db.sql

###### For ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

cp srcs_docker/self-signed.conf /etc/nginx/snippets/self-signed.conf
cp srcs_docker/ssl-params.conf  /etc/nginx/snippets/ssl-params.conf

openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
service nginx restart


/bin/sh