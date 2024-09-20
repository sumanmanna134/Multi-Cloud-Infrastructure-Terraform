#!/bin/bash
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
    sleep 1
done


#install nginx
apt-get update
apt-get -y install nginx

service nginx start
