#!/usr/bin/env bash
# -*- coding: utf-8; mode: bash -*-

git config --global user.email johndoe@nowhere.com
git config --global user.name johndoe

mkdir -p /srv/
cd /srv

git clone https://github.com/return42/searx/
cd searx
git checkout filtron
git apply /shared/searx.patch
sed -i 's/export GIT_BRANCH=master/export GIT_BRANCH=filtron/g' Makefile
make buildenv

chown -R vagrant:vagrant /srv/searx

export FORCE_TIMEOUT=0
./utils/searx.sh install all
./utils/filtron.sh install all
PUBLIC_URL_MORTY="http://$(/shared/test/eth1_ipv4.sh)/morty/" ./utils/morty.sh install all

./utils/filtron.sh nginx install
./utils/morty.sh nginx install
