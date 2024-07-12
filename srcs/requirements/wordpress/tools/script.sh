#!/bin/bash

# Wait for 5 seconds to ensure other services are ready
sleep 5

# Download WordPress core files to the current directory (--allow-root bypasses permission checks)
wp core download --allow-root

# Create WordPress configuration file wp-config.php with specified database credentials
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASS --dbhost=mariadb --allow-root

# Install WordPress with specified site URL, title, admin credentials, and email address (--allow-root bypasses permission checks)
wp core install --url=$DOMAIN_NAME --title="Benito Blog" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root

# Create a new WordPress user with specified username, email, password, and role (--allow-root bypasses permission checks)
wp user create $WP_USER $WP_EMAIL --user_pass=$WP_PASS --role=$WP_ROLE --allow-root

# Start PHP-FPM in foreground mode to handle PHP requests
/usr/sbin/php-fpm7.4 -F
