# Supported tags and respective Dockerfile links

- ```0.33.0```, ```latest```
[(0.33.0/Dockerfile)](https://github.com/cezerin/docker-cezerin/blob/master/images/0.33.0/Dockerfile)


# What is Cezerin?
[Cezerin](https://github.com/cezerin/cezerin) is React and Node.js based eCommerce platform.

# How to use this image

### Start a cezerin server instance
- port: **4000**

```shell
docker run -d \
--name store \
-p 4000:80 \
cezerin/cezerin:latest
```

- port: **4000**
- MongoDB connection

```shell
docker run -d \
--name store \
-p 4000:80 \
-e DB_HOST=255.255.255.255 \
-e DB_PORT=27017 \
-e DB_NAME=shop \
-e DB_USER=user \
-e DB_PASS=password \
cezerin/cezerin:latest
```

- port: **4000**
- MongoDB connection
- use volume


```shell
docker run -d \
--name store \
-p 4000:80 \
-e DB_HOST=255.255.255.255 \
-e DB_PORT=27017 \
-e DB_NAME=shop \
-e DB_USER=user \
-e DB_PASS=password \
-v /var/www/cezerin-on-host:/var/www/cezerin \
cezerin/cezerin:latest
```

### Environment variables

Name|Description|Default
-|-|-
`DB_HOST`|MongoDB host name or IP|`127.0.0.1`
`DB_PORT`|MongoDB server port|`27017`
`DB_NAME`|MongoDB database name|`shop`
`DB_USER`|MongoDB user name|
`DB_PASS`|MongoDB user password|

### Image contains

- **Node.js (8.10)** to run
API on **port 3001** and
Store (Server-Side Rendering) on **port 3000**.
- **Nginx (1.12.2)** as a reverse proxy to Node.js and dynamic image thumbnails. **Port 80**.
