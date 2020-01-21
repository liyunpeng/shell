#! /bin/bash
wget http://download.redis.io/releases/redis-stable.tar.gz
sudo cp redis-stable.tar.gz /usr/local
sudo tar -zxvf redis-stable.tar.gz -C /usr/local/
cd /usr/local/redis-stable
sudo make PREFIX=/usr/local/redis install
sudo rm /usr/local/redis-stable.tar.gz
sudo rm redis-stable.tar.gz

