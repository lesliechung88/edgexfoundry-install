#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * EdgeX Foundry, Fuji, version 1.1.0
#  * added: Feb 10, 2020
#  *******************************************************************************/


# kafka会用到EDGEXHOSTIP，另外启动时也会显示，别无它用
EDGEXHOSTIP=`cat ../host`
if [ "$1" = "install" ] ;then
    while true
    do
        read -r -p "确定本机IP是 $EDGEXHOSTIP 吗？如果不是，请修改host文件 [Y/n] " input
        case $input in
            [yY][eE][sS]|[yY])
               echo "是"
               break
                ;;
            [nN][oO]|[nN])
                echo "否"
                exit 1
                ;;
            *)
                echo "无效的输入..."
                ;;
        esac
    done
    sed -i "s/EDGEXHOSTIP/$EDGEXHOSTIP/g" ../compose-files/*.yml
    sed -i "s/EDGEXHOSTIP/$EDGEXHOSTIP/g" ./subin/start-mongo-edgex.sh
    sed -i "s/EDGEXHOSTIP/$EDGEXHOSTIP/g" ./subin/start-redis-edgex.sh
else
    cp -rf ./subin/bak/*.sh ./subin/
    cp -rf ../compose-files/bak/*.yml ../compose-files/
fi
