#!/bin/bash
if [ ! -f /.root_pw_set ]; then
	/set_root_pw.sh
fi

if [ -z "$(ls -A /var/lib/mysql/mysql/)" -a "${1%_safe}" = 'mysqld' ]; then
    rm -rf /var/lib/mysql/*
    chown -R mysql /var/lib/mysql && chgrp -R mysql /var/lib/mysql
    mysql_install_db
    /usr/bin/mysqld_safe
    /usr/local/bin/mysql_secure.sh '0KmF5zArK5'
	mysqladmin shutdown -u root -p"0KmF5zArK5"
fi

service php5-fpm start 
service mysql start 
service nginx start
exec /usr/sbin/sshd -D
