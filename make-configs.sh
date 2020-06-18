#!/usr/bin/env bash
# -*- coding: utf-8; mode: bash  -*-

for i in ubuntu-18.04,generic\\/ubuntu1804 ubuntu-20.04,generic\\/ubuntu2004 arch,archlinux\\/archlinux fedora,generic\\/fedora32;
do IFS=",";
   set -- $i
   NAME=$1
   IMAGE=$2
   for http_server in nginx apache;
   do
       echo "----- $NAME and $IMAGE and $http_server"
       DIR="config/${NAME}-${http_server}"
       mkdir -p "${DIR}"
       sed "s/\$NAME/searx-${NAME}-${http}/" tmpl/Vagrantfile.tmpl | sed "s/\$IMAGE/${IMAGE}/" > "${DIR}/Vagrantfile"
       sed "s/\$HTTP_SERVER/${http_server}/" tmpl/run.sh.tmpl | sed "s/\$IMAGE/${IMAGE}/" > "${DIR}/run.sh"
       chmod +x "${DIR}/run.sh"
   done
done
