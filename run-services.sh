#!/bin/bash
if [ ! -f /.root_pw_set ]; then
	/set_root_pw.sh
fi

if [ -z "$(ls -A /var/lib/mysql)" -a "${1%_safe}" = 'mysqld' ]; then
	/usr/bin/mysqld_safe & \
	sleep 10s && \
	mysql < /usr/local/src/owncloud.sql
	mysqladmin shutdown -u root -p"0KmF5zArK5"
fi

service php5-fpm start 
service mysql start 
service nginx start
exec /usr/sbin/sshd -D
