#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * EdgeX Foundry, Fuji, version 1.1.0
#  * added: Feb 10, 2020
#  *******************************************************************************/

cat ./subin/banner.txt
echo "准备安装 EdegX Foundry (fuji版)"
echo "包括的内容如下："
echo "1、机子需要连接互联网！"
echo "2、若选择安装docker,会卸载之前的docker & docker-compose "

while true
do
	read -r -p "安装 EdegX Foundry (fuji版)？ [Y/n] " input
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

# kafka会用到EDGEXHOSTIP，另外启动时也会显示，别无它用
./subin/replaceip.sh install
./subin/install-docker.sh
./subin/load-images.sh


