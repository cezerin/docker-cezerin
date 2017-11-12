FROM mongo:3.4-jessie
MAINTAINER Restmount <jsonmount@gmail.com>

ENV NGINX_CODENAME jessie
ENV NGINX_VERSION 1.12.0-1~jessie
ENV NODE_VERSION 8
ENV CEZERIN_VERSION 0.27.0

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
		nginx=${NGINX_VERSION}\
		nginx-module-image-filter=${NGINX_VERSION}

# install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
	&& apt-get install -y nodejs \
	&& npm install pm2 -g

COPY nginx.conf /etc/nginx/
COPY default.conf /etc/nginx/conf.d/
COPY docker-entrypoint.sh /usr/local/bin/

# download and build project
RUN mkdir -p /var/www \
    && cd /var/www \
    && wget -O cezerin.zip https://github.com/cezerin/cezerin/archive/v$CEZERIN_VERSION.zip \
    && unzip cezerin.zip \
    && rm cezerin.zip \
    && mv cezerin-$CEZERIN_VERSION cezerin \
    && cd cezerin \
    && npm install \
    && npm run build

WORKDIR /var/www/cezerin

EXPOSE 80

# start Nginx, MongoDB, PM2
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
