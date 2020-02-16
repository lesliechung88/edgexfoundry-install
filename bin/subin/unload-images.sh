#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * EdgeX Foundry, Fuji, version 1.1.0
#  * added: Feb 10, 2020
#  *******************************************************************************/

docker_exist=$(echo `docker version` | grep "Client")
if [[ "$docker_exist" == "" ]]
then
    echo "没有安装docker,无法删除镜!"
    exit 1
fi

if [ ! -n "$1" ] ;then
    docker rmi --force `docker images | grep guqiaochina | awk '{print $3}'`
    docker rmi --force `docker images | grep wurstmeister | awk '{print $3}'`
    docker rmi redis:5.0.5-alpine
    docker rmi consul:1.3.1
    docker rmi portainer/portainer:latest
else
    docker rmi --force `docker images | grep "$1" | awk '{print $3}'`
fi

docker rmi --force `docker images | grep none | awk '{print $3}'`
