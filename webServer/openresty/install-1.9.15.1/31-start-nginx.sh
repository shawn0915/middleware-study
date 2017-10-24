#!/bin/bash

# Def
NGINX_INSTALL="/data/apps/openresty-web"
NGINX_PID="/data/openresty-web/nginx.pid"

# Start
echo "***** Start OpenResty-web *****"

cd ${NGINX_INSTALL}/nginx/sbin/
sudo ./nginx

PID=`cat ${NGINX_PID}`
echo "Nginx_pid=${PID}"

echo "***** Done. *****"
