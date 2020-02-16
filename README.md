# edgexfoundry-install
 make edgexfoundry(fuji) auto install & uninstall, include docker docker-compose(need root user)
 Currently only supports Ubuntu OS amd 16+
 
 
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

## Start edgex
cd ./bin  
After installation, execute the following command to start edgex  

./start-edgex.sh redis  
or  
./start-edgex.sh mongo  

## Uninstall edgexfoundry 
After installation, execute the following command to start edgex  
cd ./bin  
./uninstall-edgex.sh
