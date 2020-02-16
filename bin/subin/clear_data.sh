#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * EdgeX Foundry, Fuji, version 1.1.0
#  * added: Feb 10, 2020
#  *******************************************************************************/

    if [ -d "/var/lib/docker/volumes/"$1"_consul-data/_data" ]; then
            rm -R -rf /var/lib/docker/volumes/"$1"_consul-data/_data/*
            echo "原consul缓存已清空！"
    fi
    if [ -d "/var/lib/docker/volumes/"$1"_consul-config/_data" ]; then
            rm -rf /var/lib/docker/volumes/"$1"_consul-config/_data/*
            rm -rf /var/lib/docker/volumes/"$1"_log-data/_data/*
            cp ../consulconf/0* /var/lib/docker/volumes/"$1"_consul-config/_data/

            if [[ "$2" = "mongo" ]]; then
                cp ../consulconf/m* /var/lib/docker/volumes/"$1"_consul-config/_data/
            else
                cp ../consulconf/re* /var/lib/docker/volumes/"$1"_consul-config/_data/
            fi
            echo "拷入consul配置文件！"
    fi
    if [  -d "/var/lib/docker/volumes/"$1"_db-data/_data" ]; then
            rm -rf /var/lib/docker/volumes/"$1"_db-data/_data/*
            echo "原数据库已清空！"
    fi
    if [  -d "/var/lib/docker/volumes/"$1"_images/_data" ]; then
            rm -rf /var/lib/docker/volumes/"$1"_images/_data/*
            echo "图片已清空！"
    fi
    if [  -d "/var/lib/docker/volumes/"$1"log-data/_data" ]; then
            rm -rf /var/lib/docker/volumes/"$1"log-data/_data/*
            echo "日志已清空！"
    fi