#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * EdgeX Foundry, Fuji, version 1.1.0
#  * added: Feb 10, 2020
#  *******************************************************************************/

cat ./subin/banner.txt
echo ""
if [ ! -n "$1" ] ;then
    echo "请在脚本后输入启动的版本，参数为 mongo 或 redis"
    exit
else
       if [[ "$1" = "mongo" ]]; then
            if [ ! -n "$2" ] ;then
                 ./subin/start-mongo-edgex.sh ../compose-files/docker-compose-mongo.yml
            else
                 ./subin/start-mongo-edgex.sh ../compose-files/docker-compose-mongo.yml mongo
            fi
       elif [[ "$1" = "redis" ]]; then
            if [ ! -n "$2" ] ;then
                 ./subin/start-redis-edgex.sh ../compose-files/docker-compose-redis.yml
            else
                 ./subin/start-redis-edgex.sh ../compose-files/docker-compose-redis.yml redis
            fi
       else
          echo "输入启动的版本不对，参数为 mongo 或 redis"
       fi
fi

