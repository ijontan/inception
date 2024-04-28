#!/bin/bash


service vsftpd start

useradd $FTP_USER

echo "$FTP_USER:$FTP_PWD" | /usr/sbin/chpasswd

echo "$FTP_USER" >> /etc/vsftpd.userlist 

mkdir /home/$FTP_USER /home/$FTP_USER/ftp


chown nobody:nogroup /home/$FTP_USER/ftp
chmod a-w /home/$FTP_USER/ftp

mkdir /home/$FTP_USER/ftp/files
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files

sed -i -r "s/#write_enable=YES/write_enable=YES/1"   /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1"   /etc/vsftpd.conf

echo "
local_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
local_root=/home/$FTP_USER/ftp
pasv_min_port=40000
pasv_max_port=40005
userlist_file=/etc/vsftpd.userlist
" > /etc/vsftpd.conf

service vsftpd stop


/usr/sbin/vsftpd
