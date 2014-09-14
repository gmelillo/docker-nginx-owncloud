#docker-nginx-owncloud

Latest owncloud with Nginx + Mysql + PHP5-FPM

##Setup

1. Run `docker run -p 10080:80 -p 10022:22 -d gmelillo/docker-nginx-owncloud`
2. Point your browser on `http://localhost:10080` to triggher the autoconfiguration

##Users and password

The root user will be generated automatically and prompted on `docker logs <instanceid>`.

The first administrative user is **ocadmin** with password `stachaswac`

###TODO

* ~~Make database work if external storage is mounted on `/var/lib/mysql`~~
* Support for external database
* Autobackup in sql format scheduled on exported datastore to make easy container backup
* Make HTTPS available on image.
