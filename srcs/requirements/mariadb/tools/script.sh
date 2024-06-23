#!/bin/bash

# Start MySQL service
service mysql start;

# Sleep to allow MySQL service to fully start
sleep 5

# Create database and user
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -u root -p${SQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# Shutdown MySQL server
mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

# Sleep to allow MySQL service to fully shutdown
sleep 5

# Start MySQL server in safe mode in the background
mysqld_safe &
