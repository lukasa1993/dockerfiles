#! /bin/sh

# exit if a command fails
set -e


apk update

# install mysqldump
apk add mysql-client

# install s3 tools
apk add python py-pip
pip install awscli
apk del py-pip

# install go-cron
wget https://github.com/lukasa1993/go-cron/releases/download/v0.0.7/go-cron-linux.gz
gunzip go-cron-linux.gz
mv ./go-cron-linux /usr/local/bin/go-cron
chmod u+x /usr/local/bin/go-cron

# cleanup
rm -rf /var/cache/apk/*
