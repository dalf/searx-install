#!/usr/bin/env bash
# -*- coding: utf-8; mode: bash -*-

eth1_ipv4() {
    ip -o addr show | grep eth1 \
        | sed -nr 's/[0-9]*:\s*([a-z0-9]*).*inet\s*([a-z0-9.:]*).*scope global.*/\2/p' \
        | head -n 1
}

echo "$(eth1_ipv4)"
