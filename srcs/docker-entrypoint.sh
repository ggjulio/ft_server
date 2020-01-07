#!/bin/bash


service nginx start 
service mysql start 
service php7.3-fpm start 

#########  install wordpress

wget -c https://wordpress.org/latest.tar.gz -O - | tar -xz -C /var/www
mv latest /etc/nginx/sites-available/wordpress
#chown -R www-data: /var/www/wordpress      #allow webserver complete access

#######  install phpmyadmin

wget -c https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-english.tar.gz -O - | tar -xz -C /var/www/phpmyadmin
#mv phpMyAdmin-4.9.2-english /var/www/phpmyadmin

service php7.3-fpm restart

####### configure nginx for wordpress and phpmyadmin

cp srcs_docker/nginx-block /etc/nginx/sites-available

ln -s /etc/nginx/sites-available/wordpress  /etc/nginx/sites-enabled/wordpress
#ln -s /etc/nginx/sites-available/phpmyadmin /etc/nginx/sites-enabled/phpmyadmin

/bin/sh