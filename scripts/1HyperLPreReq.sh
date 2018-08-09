#!/bin/bash

# A simple bash script to install the pre-requisites for hyplerledger composer on Ubuntu 14.04
#the script can be made executeable by issueing chmod 755 HyperledgerPreReq.sh on the command line

# Update the repos
apt update
# install dev essentials python should be installed by default verify with python3 -V
apt install build-essential libssl-dev libffi-dev python-dev
apt install gcc-c++ make
apt install git

#install docker
apt-get update
apt-get install apt-transport-https ca-certificates curl software-properties-common
# get the repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#update repo
apt-get update
#use docker repo insead of default
apt-cache policy docker-ce
apt install docker.ce
docker --version
#To verify install run sudo docker run hello-world

#install docker compose
curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-composei
docker-compose --version


#Install Node 8.X - hyperledger does not support version 9
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -n

#Install npm
apt install -y nodejs
apt install -y npm

#Check install
nodejs --version
npm --version


#install VS code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

apt update
apt install code

chmod 775 ./2HyperLComposerPreInstallDO_NOT_SUDO.sh

chmod 775 ./3HyperLComposerInstall.sh


