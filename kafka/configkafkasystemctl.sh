#! /bin/bash
# centos8 

set -v 

cat > /tmp/kafka.service <<EOF
[Unit]
Description=kafka
After=network.target remote-fs.target nss-lookup.target zookeeper.service
 
[Service]
Type=forking
Environment="PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ExecStart= /opt/kafka_2.12/bin/kafka-server-start.sh -daemon  /opt/kafka_2.12/config/server.properties

ExecReload=/bin/kill -s HUP $MAINPID

ExecStop=  /opt/kafka_2.12/bin/kafka-server-stop.sh
PrivateTmp=true
 
[Install]
WantedBy=multi-user.target
EOF

sudo cp /tmp/kafka.service  /etc/systemd/system/ 
sudo systemctl  daemon-reload
sudo systemctl  start kafka.service


sudo netstat -antp | grep 9092 

systemctl status kafka.service
