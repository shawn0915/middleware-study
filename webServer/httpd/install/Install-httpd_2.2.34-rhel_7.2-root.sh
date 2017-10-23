#!/bin/bash

rpm -qa | grep httpd | xargs rpm -e --nodeps

yum install -y openssl openssl-devel

PKG_HOME=`pwd`
INSTALL_HOME="/opt/local/apache2"

tar zxvf httpd-2.2.34.tar.gz

cd httpd-2.2.31
./configure --prefix=${INSTALL_HOME} --enable-so --enable-ssl --with-ssl --enable-mods-shared=most --enable-rewrite --enable-proxy --enable-proxy-http --enable-mpm=worker

make && make install

# install mod_ssl.so
cd ${PKG_HOME}/httpd-2.2.34/modules/ssl
${INSTALL_HOME}/bin/apxs -a -i -c -L/usr/lib/openssl/engines/lib -c *.c -lcrypto -lssl -ldl
