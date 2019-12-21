#!/bin/bash
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
echo "          guest account = nobody  " >> /etc/samba/smb.conf
echo "  [upload]    " >> /etc/samba/smb.conf
echo "          comment = upload    " >> /etc/samba/smb.conf
echo "          path = /home/master/k8s " >> /etc/samba/smb.conf
echo "          read only = no  " >> /etc/samba/smb.conf
echo "          browseable = yes    " >> /etc/samba/smb.conf
echo "          public = yes    " >> /etc/samba/smb.conf
echo "          printable = no  " >> /etc/samba/smb.conf
echo "          guest ok = yes  " >> /etc/samba/smb.conf
echo "          oplocks = no    " >> /etc/samba/smb.conf
echo "          level2 oplocks = no " >> /etc/samba/smb.conf
echo "          locking = no    " >> /etc/samba/smb.conf

#mkdir -p /home/master/k8s
chmod -R 0777 /home/master/k8s
#chown -R nobody:nobody /home/master/k8s
/etc/init.d/smbd restart
/etc/init.d/smbd enable 
