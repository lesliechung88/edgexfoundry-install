#!/bin/sh

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * EdgeX Foundry, Fuji, version 1.1.0
#  * added: Feb 10, 2020
#  *******************************************************************************/


# Start EdgeX Foundry services in right order, as described:
# https://wiki.edgexfoundry.org/display/FA/Get+EdgeX+Foundry+-+Users

COMPOSE_FILE=$1


run_service () {
    docker-compose -f "$COMPOSE_FILE" up -d $1
    echo "$1 启动完成!"
}

run_service volume

if [ -n "$2" ] ;then
     echo "清除以前老数据与配置信息！"
    ./subin/clear_data.sh composefiles mongo
else
    if [ -d "/var/lib/docker/volumes/composefiles_consul-config/_data" ]; then
        rm -rf /var/lib/docker/volumes/composefiles_consul-config/_data/*
        rm -rf /var/lib/docker/volumes/composefiles_consul-data/_data/*
        echo "原consul缓存已清空、配置删除！"
        cp ../consulconf/0* /var/lib/docker/volumes/composefiles_consul-config/_data/
        cp ../consulconf/m* /var/lib/docker/volumes/composefiles_consul-config/_data/
        echo "拷入consul配置文件！"
    fi
fi
run_service config-seed
sleep 8


run_service portainer

run_service device-simple
run_service device-virtual
#run_service device-modbus
#run_service device-mqtt
#run_service device-camera
# run_service  app-service-imagesave
# run_service app-service-pushtocore
# run_service app-service-httpexport
# run_service app-service-mqttexport
echo ""
echo "EdgeX Foundy fuji （mongo版）已启动完成！"
echo ""
cat ./subin/banner.txt
echo ""
echo "访问地址："
echo "edgex-ui ->  http://EDGEXHOSTIP:4000  登录名与密码：admin/admin"
echo "consul-ui -> http://EDGEXHOSTIP:8500 "
echo "portainer -> http://EDGEXHOSTIP:9000 "

echo ""
