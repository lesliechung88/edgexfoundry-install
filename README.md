# edgexfoundry-install
 make edgexfoundry install package  
 Currently only supports Ubuntu OS amd 16+
 
## Setup edgex 
### Step 1: Grant executable permissions in the bin directory
chmod -R + x ./bin

### Step 2: Modify a file
hosts file changed to ubuntu machine real IP

### Step 3: Modify a docker-compose file 
In dir of compose-files and compose-files/bak ,include two yml file:  
docker-compose-redis.yml and docker-compose-mongo.yml  

change images to yours in file

### Step 4: Perform the installation
cd ./bin  
./install-edgex.sh

## Start edgex
After installation, execute the following command to start edgex  

./start-edgex.sh redis  
or  
./start-edgex.sh mongo  
