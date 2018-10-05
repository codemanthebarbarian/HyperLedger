#!/bin/bash

#clean up any old containers
docker kill $(docker ps -q)
docker rm $(docker ps -aq)
docker rmi $(docker images dev-* -q)


#INSTALL CLI TOOLS
#If running behind a proxy, update npm config 
# e.g. npm config set proxy http://<proxy>:<port>
# e.g. npm conifg set https-proxy http://<proxy>:<port>

#Essential CLI Tools
npm install -g composer-cli@0.19

#utility for running a REST server and expose RESTful APIs
npm install -g composer-rest-server@0.19

#Utility for generating applicaton assets
npm install -g generator-hyperledger-composer@0.19

#Yeoman gor generating applications using generator-hyperleger-composer
npm install -g yo

#INSTALL PLAYGROUND

#Browser app for simple editing and testing of Busness networks
npm install -g composer-playground@0.19

#INSTALL HYPERLEDGER FABRIC


mkdir ~/fabric-dev-servers && cd ~/fabric-dev-servers

curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.tar.gz
tar -xvf fabric-dev-servers.tar.gz

cd ~/fabric-dev-servers
export FABRIC_VERSION=hlfv11
./downloadFabric.sh

echo "Install the Hyperledger Composer extention from the VS Code marketplace"
echo ""
echo "CONTROLLING the environment"
echo "cd ~/fabric-dev-servers"
echo "export FABRIC_VERSION=hlfv11"
echo "./startFabric.sh"
echo "./createPeerAdminCard.sh"
echo ""
echo "To START THE PLAYGROUND:"
echo "composer-playgroud"