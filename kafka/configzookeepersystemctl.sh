#! /bin/bash
# centos8 

set -v 

cat > /tmp/zk.service <<EOF
[Unit]
Description=Zookeeper
After=network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
Environment="PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/jdk1.8.0_201/bin"
ExecStart=/opt/kafka_2.12/bin/zookeeper-server-start.sh -daemon /opt/kafka_2.12/config/zookeeper.properties
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/opt/kafka_2.12/bin/zookeeper-server-stop.sh 
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF

sudo cp /tmp/zk.service  /etc/systemd/system/ 
sudo systemctl  daemon-reload
sudo systemctl  start zk.service
sleep 2
sudo systemctl status zk.service
sudo netstat -antp | grep 2181 
