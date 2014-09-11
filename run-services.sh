#!/bin/bash
if [ ! -f /.root_pw_set ]; then
	/set_root_pw.sh
fi
php5 /usr/local/bin/remove_trusted_domains.php > /usr/share/nginx/owncloud/config/config.php
chown www-data:www-data -R /usr/share/nginx/owncloud/config/ 2> /vev/null
service php5-fpm start 
service mysql start 
service nginx start
exec /usr/sbin/sshd -D
