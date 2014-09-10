FROM tutum/ubutnu:14.04
MAINTAINER Gabriel Melillo "gabriel@melillo.me"

RUN apt-get update && apt-get -y upgrade
RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

RUN echo "Europe/Berlin" > /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get -y install nginx-full php5-fpm mysql-server php5-mysql php5-gd php5-curl wget unzip
RUN /usr/bin/mysqld_safe & \
    sleep 10s && \
    mysql -e "USE mysql; UPDATE user SET password=PASSWORD('root') WHERE User='root'; FLUSH PRIVILEGES;"

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD www.conf /etc/php5/fpm/pool.d/
ADD default /etc/nginx/sites-available/

RUN wget https://download.owncloud.org/download/community/owncloud-latest.zip -O /usr/share/nginx/owncloud-latest.zip
RUN unzip /usr/share/nginx/owncloud-latest.zip -d /usr/share/nginx/
RUN chown www-data:www-data -R /usr/share/nginx/owncloud

# Cleanup
RUN apt-get -y remove wget unzip
RUN apt-get autoremove -y
RUN rm -rf /usr/share/nginx/owncloud-latest.zip

EXPOSE 80

CMD service php5-fpm start && service mysql start && nginx 

