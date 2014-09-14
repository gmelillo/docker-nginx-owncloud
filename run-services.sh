#!/bin/bash
if [ ! -f /.root_pw_set ]; then
	/set_root_pw.sh
fi
service php5-fpm start 
service mysql start 
service nginx start
exec /usr/sbin/sshd -D
