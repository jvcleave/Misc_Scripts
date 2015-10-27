#! /bin/bash
#run as sudo

apt-get install samba samba-common-bin
cp /etc/samba/smb.conf /etc/samba/smb.conf.old
rm /etc/samba/smb.conf
cp smb.conf /etc/samba/smb.conf
smbpasswd -a pi
/etc/init.d/samba restart
