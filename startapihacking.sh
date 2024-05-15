#!/bin/bash

## Updating and upgrading packages


## Installing dependencies(Just to be sure)
echo 'Installing dependencies'
sudo apt install pip git golang-go docker-compose docker.io curl

## Installing tools for API hacking
echo "Installing API hacking tools"
mkdir Opt && cd Opt

### Installing jwt_tool
echo "Installing jwt_tool"
git clone https://github.com/ticarpi/jwt_tool.git && cd jwt_tool
python -m pip install termcolor cprint pycryptodomex requests
sudo chmod +x jwt_tool && sudo ln -s ./jwt_tool /usr/local/bin/jwt_tool && cd ..

### Installing kiterunner
echo "Installing kiterunner" 
git clone https://github.com/assetnote/kiterunner.git && cd kiterunner
sudo make build
sudo ln -s ~/dist/kr /usr/local/bin/kr

### Installing Arjun
echo "Installing Arjun"
git clone https://github.com/s0md3v/Arjun.git && cd Arjun
python setup.py && cd ..

### Installing zaproxy
echo 'Installing zaproxy ...'
sudo apt install zaproxy
echo 'Remember to enable OpenAI support'

### Installing Postman
echo "installing Postman"
curl -o postman.tar.gz https://dl.pstmn.io/download/latest/linux_64
mkdir Postman
tar -xzvf postman.tar.gz -C ./Postman && sudo rm postman.tar.gz
sudo ln -s ./Postman/app/postman /usr/local/bin/postman

### Installing mitmproxy2swagger
echo "Installing mitmproxy2swagger"
sudo pip install mitmproxy2swagger

## Setting Up the labs
echo "Setting up the labs"
cd .. && mkdir APIhacking && cd APIhacking
mkdir crAPI && mkdir vAPI

### crAPI
echo "Creating crAPI"
cd crAPI
curl -o docker-compose.yml https://raw.githubusercontent.com/OWASP/crAPI/main/deploy/docker/docker-compose.yml
sudo docker-compose pull
sudo docker-compose -f docker-compose.yml --compatibility up -d
echo 'Port 8888 is for the main web app and port 8025 is for mailhog'
cd ..

### vAPI
echo "Creating vAPI"
cd vAPI
git clone https://github.com/roottusk/vapi.git && cd vapi
sudo docker-compose up -d
echo 'Web at is at port 80'
echo 'Use: docker ps - to view running containers'
echo 'hAPI Hacking!!!'
