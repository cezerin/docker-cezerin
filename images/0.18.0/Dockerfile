FROM node:8-alpine
MAINTAINER Restmount <jsonmount@gmail.com>

ENV CEZERIN_VERSION 0.18.0

RUN apk add --no-cache \
    bash \
    zip \
    unzip \
    wget \
    ca-certificates

RUN mkdir -p /var/www \
    && cd /var/www \
    && wget -O cezerin.zip https://github.com/cezerin/cezerin/archive/v$CEZERIN_VERSION.zip \
    && unzip cezerin.zip \
    && rm cezerin.zip \
    && mv cezerin-$CEZERIN_VERSION cezerin \
    && cd cezerin \
    && npm install \
    && npm run build \
    && npm install pm2 -g

WORKDIR /var/www/cezerin

EXPOSE 3000
CMD ["pm2", "start", "process.json", "--no-daemon"]
# the --no-daemon is a minor workaround to prevent the docker container from thinking pm2 has stopped running and ending itself
