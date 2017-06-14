# How to use this Docker image

## Run Cezerin
To run a Cezerin server on 80 port.
```shell
docker run --name cezerin -p 80:3000 cezerin/cezerin
```

To run a Cezerin server on 80 port and map to host directory /var/www/cezerin
```shell
docker run --name cezerin -v /var/www/cezerin:/var/www/cezerin -p 80:3000 cezerin/cezerin
```


## Docker Compose
```shell
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
