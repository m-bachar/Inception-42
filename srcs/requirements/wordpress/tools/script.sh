#!/bin/bash

sleep 5

wp core download --allow-root

wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASS --dbhost=mariadb --allow-root

wp core install --url=$DOMAIN_NAME --title="Benito Blog" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root

/usr/sbin/php-fpm7.4 -F