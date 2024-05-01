#!/bin/bash


# service vsftpd start

useradd $FTP_USER

echo "$FTP_USER:$FTP_PWD" | /usr/sbin/chpasswd

echo "$FTP_USER" >> /etc/vsftpd.userlist 

mkdir /home/$FTP_USER /home/$FTP_USER/ftp
mkdir -p /var/www/html
chown $FTP_USER:$FTP_USER /var/www/html



# chown nobody:nogroup /home/$FTP_USER/ftp
# chmod a-w /home/$FTP_USER/ftp
#
# mkdir /home/$FTP_USER/ftp/files
# chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files

rm /etc/vsftpd.conf
cp /vsftpd.conf /etc/


# service vsftpd stop

echo "done"
/usr/sbin/vsftpd /etc/vsftpd.conf
