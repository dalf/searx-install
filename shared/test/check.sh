#!/usr/bin/env bash
# -*- coding: utf-8; mode: bash -*-

# IP see config.vm.network
echo
echo "searx (filtron) URL:  http://$(/shared/test/eth1_ipv4.sh)/searx"
echo "morty public URL:     http://$(/shared/test/eth1_ipv4.sh)/morty"
echo

# TODO
# check systemd services
# check localhost:8888 is opened
# check localhost:4004 is opened
# check localhost:4005 is opened
# check localhost:3000 is opened
# check 0.0.0.0:8888 is not opened
# check 0.0.0.0:4004 is not opened
# check 0.0.0.0:4005 is not opened
# check 0.0.0.0:3000 is not opened
# check http://localhost/searx answer
# check as curl request to http://localhost/searx?q=test
# check as firefox request to http://localhost/searx?q=test
# check as firefox request to http://localhost/searx?q=!image+test
# check if images are proxied
# check each images
# check filtron: 10 requests in one second --> check 429
