# Supported tags and respective Dockerfile links

- ```0.25.0```, ```latest```
[(0.25.0/Dockerfile)](https://github.com/cezerin/docker-cezerin/blob/master/images/0.25.0/Dockerfile)
- ```0.21.0```
[(0.21.0/Dockerfile)](https://github.com/cezerin/docker-cezerin/blob/master/images/0.21.0/Dockerfile)
- ```0.18.0```
[(0.18.0/Dockerfile)](https://github.com/cezerin/docker-cezerin/blob/master/images/0.18.0/Dockerfile)


# What is Cezerin?
Cezerin is an open-source e-commerce platform built with JavaScript only. [GitHub](https://github.com/cezerin/cezerin)


# How to use this image

### Start a cezerin server instance
- port: **3000**
- storage: **container**

```shell
docker run -d --name store -p 3000:80 cezerin/cezerin:latest
```

- port: **80**
- storage: **volumes**

```shell
docker run -d --name store \
-v /var/www/cezerin/db:/data/db \
-v /var/www/cezerin/public/static:/var/www/cezerin/public/static \
-v /var/www/cezerin/config/server.js:/var/www/cezerin/config/server.js \
-p 80:80 \
cezerin/cezerin:latest
```

### Image contains

**Nginx**
- serve static files
- proceed thumbnails with caching
- if file not exists - proxy to Cezerin (NodeJS server on port 3000)

**MongoDB**
- map host volume /var/www/db

**Cezerin**
- map host volume /var/www/cezerin
