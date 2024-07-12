#!/bin/sh

# Initialize MySQL data directory
mysql_install_db

# Start MySQL server in safe mode in the background
mysqld_safe &

# Allow some time for MySQL server to start up (5 seconds)
sleep 5

# Run MySQL commands using echo and pipe to mysql client to initialize database and grant privileges
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
      GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS'; \
      ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_PASS}'; \
      FLUSH PRIVILEGES;" | mysql -u root -p${MYSQL_PASS}

# Shutdown MySQL server gracefully using mysqladmin
mysqladmin shutdown -p${MYSQL_PASS}

# Restart MySQL server in safe mode
mysqld_safe
