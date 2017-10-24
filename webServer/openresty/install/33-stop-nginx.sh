#!/bin/bash

echo "***** Stop OpenResty-web *****"

NGINX_INSTALL="/data/apps/openresty-web/nginx/sbin/"

cd ${NGINX_INSTALL}
sudo ./nginx -s stop

echo "***** Done. *****"
