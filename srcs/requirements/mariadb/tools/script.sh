#!/bin/sh
mysql_install_db
mysqld_safe  &
sleep 5

echo  "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';" \
     "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_PASS}';" "FLUSH PRIVILEGES;" | mysql -u root -p${MYSQL_PASS}

mysqladmin shutdown -p${MYSQL_PASS}
mysqld_safe