#!/bin/bash

chown www-data:www-data -R /usr/share/nginx/html/
service mysql stop
mysqld --skip-grant-tables --skip-networking &
mysql -u root mysql <<EOF
UPDATE user SET password=PASSWORD("root") WHERE User='root';
FLUSH PRIVILEGES;
exit;
EOF
killall mysqld 
service mysql restart
