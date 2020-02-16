#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * EdgeX Foundry, Fuji, version 1.1.0
#  * added: Feb 10, 2020
#  *******************************************************************************/

compose_exist=$(echo `docker-compose version` | grep "version")
if [[ "$compose_exist" == "" ]]
then
    echo "没有安装docker-compose,请确保安装docker，且当前用户有docker权限!"
    exit 1
fi

if [ ! -n "$1" ] ;then
    echo "请在脚本后输入停止的版本，参数为 mongo 或 redis"
    exit
else
       if [[ "$1" = "mongo" ]]; then
          mongoRuning=$(echo `docker ps -a | grep mongo`)
          if [[ "$mongoRuning" != "" ]]; then
              docker-compose -f ../compose-files/docker-compose-mongo.yml down --remove-orphans
              echo ""
              echo "EdgeX Foundry (mongo版) 已停止"
              echo ""
              cat ./subin/banner.txt
              echo ""
          else
              echo "mongo版没有启动"
          fi

       elif [[ "$1" = "redis" ]]; then
          redisRuning=$(echo `docker ps -a | grep redis`)
          if [[ "$redisRuning" != "" ]]; then
              docker-compose -f ../compose-files/docker-compose-redis.yml down
              echo ""
              echo "EdgeX Foundry (mongo版) 已停止"
              echo ""
              cat ./subin/banner.txt
              echo ""
          else
              echo "redis版没有启动"
          fi
       else
          echo "输入停止的版本不对，参数为 mongo 或 redis"
       fi
fi

