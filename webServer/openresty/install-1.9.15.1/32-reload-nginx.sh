#!/bin/bash

echo "***** Reload OpenResty-web *****"

NGINX_INSTALL="/data/apps/openresty-web/nginx/sbin/"

cd ${NGINX_INSTALL}
sudo ./nginx -s reload

echo "***** Done. *****"
