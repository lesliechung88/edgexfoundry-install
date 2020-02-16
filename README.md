# edgexfoundry-install
 make edgexfoundry install package  
 Currently only supports Ubuntu OS amd 16+
 
## setup edgex 
### Step 1: Grant executable permissions in the bin directory
chmod -R + x ./bin

### Step 2: Modify a file
hosts file changed to ubuntu machine real IP

### Step 3: Perform the installation
cd ./bin  
./install-edgex.sh

## start edgex
After installation, execute the following command to start edgex  

./start-edgex.sh redis  
or  
./start-edgex.sh mongo  
