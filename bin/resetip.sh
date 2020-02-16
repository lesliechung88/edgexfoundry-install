#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * EdgeX Foundry, Fuji, version 1.1.0
#  * added: Feb 10, 2020
#  *******************************************************************************/

while true
do
	read -r -p "确定要重置IP吗？ [Y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
			echo "是"
			cp -rf ./subin/bak/*.sh ./subin/
			cp -rf ../compose-files/bak/*.yml ../compose-files/
			./subin/replaceip.sh install
			echo "IP已重置为：`cat ../host`"
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

