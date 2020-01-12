#!/bin/bash 
# 适合于centos8
# 如果安装的是cenos8服务器，需要关闭防火墙和selinux
# sudo systemctl stop firewalld.service
# getenforce
# sudo setenforce 0


set -v

USER=`ls /home`

echo $USER

yum -y install samba samba-client


mv /etc/samba/smb.conf /etc/samba/smb.conf.backup

echo "  [global]    " > /etc/samba/smb.conf
echo "          workgroup = PXESERVER   " >> /etc/samba/smb.conf
echo "          server string = Samba Server Version %v " >> /etc/samba/smb.conf
echo "          log file = /var/log/samba/log.%m    " >> /etc/samba/smb.conf
echo "          max log size = 50   " >> /etc/samba/smb.conf
echo "          idmap config * : backend = tdb  " >> /etc/samba/smb.conf
echo "          cups options = raw  " >> /etc/samba/smb.conf
echo "          netbios name = pxe  " >> /etc/samba/smb.conf
echo "          map to guest = bad user " >> /etc/samba/smb.conf
echo "          dns proxy = no  " >> /etc/samba/smb.conf
echo "          public = yes    " >> /etc/samba/smb.conf
echo "          kernel oplocks = no " >> /etc/samba/smb.conf
echo "          nt acl support = no " >> /etc/samba/smb.conf
echo "          security = user " >> /etc/samba/smb.conf
echo "          guest account = ${USER} " >> /etc/samba/smb.conf
echo "  [upload]    " >> /etc/samba/smb.conf
echo "          comment = upload    " >> /etc/samba/smb.conf
echo "          path = /home/${USER}  " >> /etc/samba/smb.conf
echo "          read only = no  " >> /etc/samba/smb.conf
echo "          force userd = ${USER}  " >> /etc/samba/smb.conf
echo "          public = yes    " >> /etc/samba/smb.conf
echo "          printable = no  " >> /etc/samba/smb.conf
echo "          guest ok = yes  " >> /etc/samba/smb.conf
echo "          oplocks = no    " >> /etc/samba/smb.conf
echo "          level2 oplocks = no " >> /etc/samba/smb.conf
echo "          locking = no    " >> /etc/samba/smb.conf

#mkdir -p /home/master/k8s
chmod -R 0777 /home/${USER}
#chown -R nobody:nobody /home/master/k8s
systemctl start smb nmb
systemctl enable smb nmb
