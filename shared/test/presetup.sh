#!/usr/bin/env bash
# -*- coding: utf-8; mode: bash -*-

# ubuntu, debian, arch, fedora ...
DIST_ID=$(source /etc/os-release; echo "$ID");

case $DIST_ID in
    ubuntu-*|debian-*)
	export DEBIAN_FRONTEND=noninteractive
	export DEBIAN_FRONTEND=noninteractive
	apt-get update -y
	apt-get upgrade -y
	;;
    arch)
	pacman -Syu --noconfirm
	;;
    fedora)
	dnf update -y
	;;
esac
