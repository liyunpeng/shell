#! /bin/bash
set -v

apt-get install nfs-utils -y
showmount -e 192.168.0.214
