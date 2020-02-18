# edgexfoundry-install

 Automate edgexfoundry installation, including docker & docker-compose(need root user)  
 Help users quickly run edgexfoundry and understand its features   
 
 Currently only supports Ubuntu ,Suggest Ubuntu 16+ amd64
 
 自动化安装edgexfoundry, 目前只支持Ubuntu, 建议Ubuntu 16+  
 
 
## Install edgexfoundry 
### Step 1: Grant executable permissions in the bin directory

chmod -R +x ./bin

### Step 2: Modify a file

Modify IP in hosts file to Ubuntu machine real IP

### Step 3: Modify docker-compose files 

In the directory of compose-files and compose-files/bak ,each directory include two same .yml files:  
docker-compose-redis.yml and docker-compose-mongo.yml  

Modify image to yours in file

### Step 4: Put using images into images directory

In the directory of images holds using images which is defined in directory of compose-files and compose-files/bak composefile

### Step 5: Perform the installation

cd ./bin  
./install-edgex.sh

## Start or Stop edgex services

execute the following command to start or stop edgex:

cd ./bin  

./start-edgex.sh redis  
or  
./start-edgex.sh mongo  


## Start or Stop single service

cd ./bin  
./start-one-service.sh DATATYPE SERVICENAME  
./stop-one-service.sh DATATYPE SERVICENAME  
./restart-one-service.sh DATATYPE SERVICENAME  

vaule of DATATYPE is redis or mongo  
value of SERVICENAME is Defined in composefile

## Unload edgexfoundry 

if you want to unload edgex, execute the following command: 

cd ./bin  
./uninstall-edgex.sh

## Download the prepared installation package
下载已打好的安装包edgexfoundry(fuji版)  
[edgex-fuji_standard_1.1.0.tar.gz](http://edgexfoundry.net/discuz/forum.php?mod=viewthread&tid=74&extra=page%3D1)



## application images
![image](/appimg/edgex-install1.png)
![image](https://github.com/lesliechung88/edgexfoundry-install/blob/master/appimg/edgex-install2.png)
![image](https://github.com/lesliechung88/edgexfoundry-install/blob/master/appimg/edgex-run1.png)
![安装界面](https://images.gitee.com/uploads/images/2020/0218/112811_7ba22436_1674860.png "edgex-install1.png")
![安装完成](https://images.gitee.com/uploads/images/2020/0218/112839_0599d795_1674860.png "edgex-install2.png")
![UI图像显示](https://images.gitee.com/uploads/images/2020/0218/112900_7f57cb7f_1674860.png "edgex-run1.png")
