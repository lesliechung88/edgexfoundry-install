#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * EdgeX Foundry, Fuji, version 1.1.0
#  * added: Feb 10, 2020
#  *******************************************************************************/

cat ./subin/banner.txt
remove_docker() {
    echo ""
    echo "开始卸载docker"
    apt-get remove --auto-remove --purge docker docker-engine docker-ce docker.io docker-ce-cli -y
    rm -rf /var/lib/docker
    rm -rf /usr/local/bin/docker-compose
    echo "卸载docker完毕！"
    echo ""
}

echo "准备卸载edgex fuji"
echo "包括的内容如下："
echo "1、停止edgex服务"
echo "2、删除edgex相关镜像 "



while true
do
	read -r -p "请确认卸载？ [Y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
			echo "是"
			./subin/replaceip.sh uninstall
			echo "正在停止服务...."
           redisRuning=$(echo `docker ps -a | grep redis`)
           if [[ "$redisRuning" != "" ]]; then
                docker-compose -f ../compose-files/docker-compose-redis.yml down --remove-orphans
           fi
           mongoRuning=$(echo `docker ps -a | grep mongo`)
           if [[ "$mongoRuning" != "" ]]; then
                 docker-compose -f ../compose-files/docker-compose-mongo.yml down --remove-orphans
           fi
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

while true
do
	read -r -p "请确认卸载 docker & docker-compose？ [Y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
		   echo "是"
           whoami=$(echo `whoami`)
           if [[ "$whoami" != "root" ]]
           then
             echo "当前为非root用户：$whoami,不能卸载docker!切换到root用户操作"
             exit 0
           else
                ./subin/unload-images.sh
                remove_docker
                echo ""
                echo "EdgeX Foundry (fuji) 卸载完毕!"
                echo ""
                cat ./subin/banner.txt
                echo ""
                rm -rf ../compose-files
                rm -rf ../consulconf
                rm -rf ../images
                rm -rf ../host
                rm -rf ../VERSION
                rm -rf ../bin
           #     rm -rf ../../edgex-fuji
                echo ""
                break
           fi
		   ;;
	    [nN][oO]|[nN])
			echo "否"
			./subin/unload-images.sh
			echo "选择了不删除docker"
			echo ""
			echo "EdgeX Foundry (fuji) 卸载完毕!"
			echo ""
			echo "需手工删除安装目录edgex-fuji"
            echo ""
            cat ./subin/banner.txt
            echo ""
			break
			;;
	    *)
			echo "无效的输入..."
			;;
	esac
done



