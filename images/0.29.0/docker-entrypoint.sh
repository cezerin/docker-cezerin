#!/bin/sh
set -e

nginx
mongod --fork --logpath /var/log/mongodb.log;
exec pm2 start process.json --no-daemon
