#!/bin/bash

VERSION=${1:-"1.9.15.1"}
PKG=ngx_openresty-$VERSION

apt-get update
apt-get install -y libpcre3-dev build-essential libssl-dev sudo libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make git > /dev/null 2>&1

#Install openresty
wget http://openresty.org/download/${PKG}.tar.gz
tar xzf ${PKG}.tar.gz
cd $PKG
./configure --prefix=/usr/local/openresty --with-luajit
make
make install

# Install packages
apt-get install -y lua5.1 luarocks
luarocks install lpeg alt-getopt luafilesystem moonscript
luarocks install lapis

#Create new lapis project
cd /home/vagrant/lapis
lapis new --lua
