#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * EdgeX Foundry, Fuji, version 1.1.0
#  * added: Feb 10, 2020
#  *******************************************************************************/

stop_service () {
    docker-compose -f $1 stop $2
    docker-compose -f $1 rm $2
    echo "$2 服务停止!"
}

if [ ! -n "$1" ] ;then
    echo "请在脚本后输入启动服务的版本，命令格式如下："
    echo "./stop-one-service.sh mongo XXX服务名"
    echo "或者"
    echo "./stop-one-service.sh redis XXX服务名"
    exit
else
       if [[ "$1" = "mongo" ]]; then
           mongoRuning=$(echo `docker ps -a | grep mongo`)
           if [[ "$mongoRuning" != "" ]]; then
                if [ ! -n "$2" ] ;then
                    echo "请服务名称，见compose-files目录下的相应docker-compose文件"
                else
                    stop_service  ../compose-files/docker-compose-mongo.yml $2
                fi
            else
                echo "目前运行的不是mongo版，请将第一个参数设为redis试试"
            fi

       elif [[ "$1" = "redis" ]]; then
           redisRuning=$(echo `docker ps -a | grep redis`)
           if [[ "$redisRuning" != "" ]]; then
                if [ ! -n "$2" ] ;then
                   echo "请服务名称，见compose-files目录下的相应docker-compose文件"
                else
                   stop_service  ../compose-files/docker-compose-redis.yml $2
                fi
            else
                echo "目前运行的不是redis版，请将第一个参数设为mongo试试"
            fi
       else
            echo "请在脚本后输入启动服务的版本，命令格式如下："
            echo "./stop-one-service.sh mongo XXX服务名"
            echo "或者"
            echo "./stop-one-service.sh redis XXX服务名"
       fi
fi

