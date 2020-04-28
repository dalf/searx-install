#!/usr/bin/env bash
# -*- coding: utf-8; mode: bash -*-

# IP see config.vm.network
echo
echo "searx (filtron) URL:  http://$(/shared/test/eth1_ipv4.sh)/searx"
echo "morty public URL:     http://$(/shared/test/eth1_ipv4.sh)/morty"
echo

# check systemd services
