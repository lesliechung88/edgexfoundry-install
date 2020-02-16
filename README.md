# edgexfoundry-install
 make edgexfoundry(fuji) auto install & uninstall, include docker docker-compose(need root user)
 Currently only supports Ubuntu ,Suggest Ubuntu 16+ amd64
 
 
## Install edgexfoundry 
### Step 1: Grant executable permissions in the bin directory

chmod -R + x ./bin

### Step 2: Modify a file

hosts file changed to ubuntu machine real IP

### Step 3: Modify docker-compose files 

In dir of compose-files and compose-files/bak ,include two yml files:  
docker-compose-redis.yml and docker-compose-mongo.yml  

change images to yours in file

### Step 4: Perform the installation

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
