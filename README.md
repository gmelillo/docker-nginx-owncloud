docker-nginx-owncloud
=====================

Latest owncloud with Nginx + Mysql + PHP5-FPM

**Setup**

- **Run** *docker run -p 10080:80 -p 10022:22 -d gmelillo/docker-nginx-owncloud*
- Point your browser on http://localhost:10080 to triggher the autoconfiguration

**Users and password**

The root user will be generated automatically and prompted on docker logs <instanceid>.
The first administrative user is **ocadmin** with password **stachaswac**
