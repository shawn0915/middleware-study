#!/bin/bash

# Def Var
PWD=`pwd`
PKG_DIR="${PWD}/../pkg"
NGINX_INSTALL="/data/app/openresty-web"
DATA_DIR="/data/app/openresty-web"
LOG_DIR="/data/app/openresty-web"

# Install
cd ${PKG_DIR}
tar zxvf pcre-8.38.tar.gz
tar zxvf zlib-1.2.8.tar.gz
tar zxvf ngx_cache_purge-2.3.tar.gz

tar zxvf openresty-1.9.15.1.tar.gz
cd openresty-1.9.15.1

mkdir -pv ${DATA_DIR}/{client_body_temp,proxy_temp,fastcgi_temp}

./configure --prefix=${NGINX_INSTALL} \
--error-log-path=${LOG_DIR}/nginx/error.log \
--pid-path=${DATA_DIR}/nginx.pid \
--http-log-path=${LOG_DIR}/nginx/access.log  \
--http-client-body-temp-path=${DATA_DIR}/client_body_temp \
--http-proxy-temp-path=${DATA_DIR}/proxy_temp \
--http-fastcgi-temp-path=${DATA_DIR}/fastcgi_temp \
--without-http_uwsgi_module \
--without-http_scgi_module \
--with-luajit \
--with-pcre=${PKG_DIR}/pcre-8.38 \
--with-zlib=${PKG_DIR}/zlib-1.2.8 \
--with-http_ssl_module \
--with-http_stub_status_module  \
--with-http_realip_module \
--with-http_gzip_static_module  \
--with-http_iconv_module \
--with-http_gzip_static_module \
--add-module=${PKG_DIR}/ngx_cache_purge-2.3

gmake && gmake install

cp -av ${PKG_DIR}/nginx-web.conf ${NGINX_INSTALL}/nginx/conf/nginx.conf

echo "***** Done. *****"
