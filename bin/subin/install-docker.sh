#!/bin/bash

# /*******************************************************************************
#  * Copyright 2020 古桥教育
#  * @author: 灰哥哥 1778006949@qq.com
#  * EdgeX Foundry, Fuji, version 1.1.0
#  * added: Feb 10, 2020
#  *******************************************************************************/

echo "准备安装 docker-ce 18.09.9 & docker-compose 1.18.0"
echo "包括的内容如下："
echo "1、机子需要连接互联网！"
echo "2、会卸载之前的docker & docker-compose "

while true
do
	read -r -p "请确定本机在安装 docker & docker-compose，并连接上互联网？ [Y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
		   echo "是"
           whoami=$(echo `whoami`)
           if [[ "$whoami" != "root" ]]
           then
             echo "当前为非root用户：$whoami,不能安装docker!切换到root用户操作"
             exit 0
           else
			  break
           fi
			;;
	    [nN][oO]|[nN])
			echo "否"
			echo "选择了不安装docker，可能会导致无法运行edgex"
			exit 1
			;;
	    *)
			echo "无效的输入..."
			;;
	esac
done

echo ""
echo ""
echo "备份/etc/apt/sources.list，使用阿里源"
cp /etc/apt/sources.list /etc/apt/sources.list.bak
if [ "`ls -A /etc/apt/sources.list.d`" != "" ];
then
    mkdir /etc/apt/sources.list.d.bak
    mv /etc/apt/sources.list.d/* /etc/apt/sources.list.d.bak/
    echo "/etc/apt/sources.list.d目录下的文件，临时移至etc/apt/sources.list.d.bak目录下"
fi

cat > /etc/apt/sources.list << EOF
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse

EOF

echo ""
echo "更新源包"
apt-get update
#apt-get upgrade -y


#apt-get install openssh-server -y
#apt install net-tools -y
#apt-get install vim -y

echo ""
echo "安装curl"
apt install curl -y

echo ""
echo "移除旧docker"
apt-get remove --auto-remove --purge docker docker-engine docker-ce docker.io docker-ce-cli -y
rm -rf /var/lib/docker
rm -rf /usr/local/bin/docker-compose

echo ""
echo "获取 docker apt-key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo ""
echo "使用阿里docker源"
add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"

echo ""
echo "更新源包"
apt-get update -y
apt-get install docker-ce=5:18.09.9~3-0~ubuntu-bionic -y

if [ -d "/etc/apt/sources.list.d.bak" ];then
   mv /etc/apt/sources.list.d.bak/* /etc/apt/sources.list.d/
   rm -rf /etc/apt/sources.list.d.bak
   echo "/etc/apt/sources.list.d目录下文件已恢复"
fi

mv /etc/apt/sources.list.bak /etc/apt/sources.list
echo "/etc/apt/sources.list已恢复，若想使用以前的源安装软件，需要执行：sudo apt-get update -y"

echo ""
echo "docker-compose"
cp ../compose-files/docker-compose /usr/local/bin/
chmod +x /usr/local/bin/docker-compose

echo ""
echo ""
echo "docker & docker-compose安装完毕!"
echo ""
echo ""