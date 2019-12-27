#! /bin/bash

username=`ls /home/`
sudo apt-get install git -y
sudo apt-get install vim -y
sudo apt-get install curl -y

git config --global user.email "kylin@126.com"
git config --global user.name ${ussername} 

