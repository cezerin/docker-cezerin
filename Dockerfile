FROM node:8
MAINTAINER Restmount <jsonmount@gmail.com>

ENV NGINX_CODENAME jessie
ENV CEZERIN_VERSION 0.33.0

# install requirements and NGINX
RUN echo "deb http://nginx.org/packages/debian/ ${NGINX_CODENAME} nginx" >> /etc/apt/sources.list \
	&& apt-get update && apt-get install --no-install-recommends --no-install-suggests -y --force-yes \
		bash \
		zip \
		unzip \
		wget \
		curl \
		nano \
		ca-certificates \
		nginx\
		nginx-module-image-filter

# install PM2
RUN npm install pm2 -g

# download project
RUN mkdir -p /var/www \
    && cd /var/www \
    && wget -O cezerin.zip https://github.com/cezerin/cezerin/archive/v$CEZERIN_VERSION.zip \
    && unzip cezerin.zip \
    && rm cezerin.zip \
    && mv cezerin-$CEZERIN_VERSION cezerin

# overwrite config
COPY config/* /var/www/cezerin/config/

# overwrite PM2 process file
COPY process.json /var/www/cezerin/

# Nginx config
COPY nginx/nginx.conf /etc/nginx/
COPY nginx/default.conf /etc/nginx/conf.d/

# script to run Nginx and PM2
COPY docker-entrypoint.sh /usr/local/bin/

# build project
RUN cd /var/www/cezerin \
    && npm install \
    && npm run build

WORKDIR /var/www/cezerin

EXPOSE 80

# start Nginx, PM2
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
