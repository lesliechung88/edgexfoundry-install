#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * EdgeX Foundry, Fuji, version 1.1.0
#  * added: Feb 10, 2020
#  *******************************************************************************/

dir=../images

docker_exist=$(echo `docker version` | grep "Client")
if [[ "$docker_exist" = "" ]]
then
    echo "没有安装docker,请确保安装docker，且当前用户有docker权限!"
    echo ""
    echo "Edgex Foundry (fuji)安装失败!"
    echo ""
    exit 1
fi

if [ ! -n "$1" ] ;then
    for file in $dir/*; do
        echo $file
        docker load -i $dir/$file
    done
    echo ""
    cat ./subin/banner.txt
    echo ""
    echo "Edgex Foundry (fuji)安装完毕!"
    echo "通过如下命令可以启动edgex"
    echo ""
    echo "mongo版运行：./start-edgex.sh mongo"
    echo "redis版运行：./start-edgex.sh redis"

else
    for file in $dir/*; do
       result=$(echo $file | grep "$1")
       if [[ "$result" != "" ]]
       then
             echo $file
             docker load -i $dir/$file

       fi
    done
fi



