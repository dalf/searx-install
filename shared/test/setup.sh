#!/usr/bin/env bash
# -*- coding: utf-8; mode: bash -*-

git config --global user.email johndoe@nowhere.com
git config --global user.name johndoe

HTTP_SERVER = "$1"

mkdir -p /srv/
cd /srv

git clone https://github.com/return42/searx/
cd searx
git checkout filtron
git apply /shared/searx.patch

# brand: branch filtron
sed -i 's/export GIT_BRANCH=master/export GIT_BRANCH=filtron/g' Makefile
# brand: set SEARX_URL to VM's *host-only* IP
sed -i "s/export SEARX_URL=https:\/\/searx.me/export SEARX_URL=http:\/\/$(/shared/test/eth1_ipv4.sh)\/searx/g" Makefile

make buildenv

chown -R vagrant:vagrant /srv/searx

export FORCE_TIMEOUT=0
./utils/searx.sh install all
./utils/filtron.sh install all
./utils/morty.sh install all

./utils/filtron.sh "{$HTTP_SERVER}" install
./utils/morty.sh "{$HTTP_SERVER}" install
