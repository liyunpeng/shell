#! /bin/bash

sudo apt-get install mysql-server

sudo mysql_secure_installation

systemctl status mysql.service

# sudo mysql -uroot -p

