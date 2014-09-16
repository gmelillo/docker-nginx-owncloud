#!/bin/bash
chmod +x /usr/local/bin/*.sh

if [ ! -f /.root_pw_set ]; then
	/set_root_pw.sh
fi

if [ ! -d "/var/lib/mysql/mysql/" ]; then
    rm -rf /var/lib/mysql/*
    chown -R mysql /var/lib/mysql && chgrp -R mysql /var/lib/mysql
    mysql_install_db >> /dev/null
    service mysql start >> /dev/null
    /usr/local/bin/mysql_secure.sh 0KmF5zArK5 >> /dev/null
    mysqladmin -uroot -p0KmF5zArK5 shutdown
fi

service php5-fpm start >> /dev/null
service mysql start >> /dev/null
service nginx start >> /dev/null
exec /usr/sbin/sshd -D
