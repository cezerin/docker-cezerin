# Supported tags and respective Dockerfile links

- ```0.18.0```, ```latest```
[(0.18.0/Dockerfile)](https://github.com/cezerin/docker-cezerin/blob/master/images/0.18.0/Dockerfile)


# What is Cezerin?
Cezerin is an open-source e-commerce platform built with JavaScript only. [GitHub](https://github.com/cezerin/cezerin)


# How to use this image

### Start a cezerin server instance
on 3000 port
```shell
docker run --name cezerin cezerin/cezerin
```

on 80 port
```shell
docker run --name cezerin -p 80:3000 cezerin/cezerin
```

# Docker Compose
```shell
git clone https://github.com/cezerin/docker-cezerin
cd docker-cezerin/compose
docker-compose up
```

**Nginx**
- serve static files
- proceed thumbnails with caching
- if file not exists - proxy to Cezerin (NodeJS server on port 3000)

**MongoDB**
- map host volume /var/www/db

**Cezerin**
- map host volume /var/www/cezerin

# Where to Store Data
Important note: There are several ways to store data used by applications that run in Docker containers. We encourage users of the cezerin images to familiarize themselves with the options available, including:

- Let Docker manage the storage of your database data [by writing the database files to disk on the host system using its own internal volume management](https://docs.docker.com/engine/tutorials/dockervolumes/#adding-a-data-volume). This is the default and is easy and fairly transparent to the user. The downside is that the files may be hard to locate for tools and applications that run directly on the host system, i.e. outside containers.
- Create a data directory on the host system (outside the container) and [mount this to a directory visible from inside the container](https://docs.docker.com/engine/tutorials/dockervolumes/#mount-a-host-directory-as-a-data-volume). This places the database files in a known location on the host system, and makes it easy for tools and applications on the host system to access the files. The downside is that the user needs to make sure that the directory exists, and that e.g. directory permissions and other security mechanisms on the host system are set up correctly.


1. Create a data directory on a suitable volume on your host system, e.g. /app/cezerin.
2. Start your cezerin container like this:

```shell
docker run --name cezerin -v /app/cezerin:/var/www/cezerin -p 80:3000 cezerin/cezerin
```

The ```-v /app/cezerin:/var/www/cezerin``` part of the command mounts the ```/app/cezerin``` directory from the underlying host system as ```/var/www/cezerin``` inside the container, where Cezerin by default will write its data files.
