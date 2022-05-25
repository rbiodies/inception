mv /var/www/vsftpd.conf /etc/vsftpd/vsftpd.conf

# Добавьте FTP_USER, измените его пароль и объявите его владельцем папки wordpress и всех подпапок
adduser $FTP_USR --disabled-password
echo "$FTP_USR:$FTP_PWD" | /usr/bin/chpasswd &> /dev/null
chown -R $FTP_USR:$FTP_USR /var/www/html/wordpress

# dev/null выглядит пустым при чтении из него, тогда как данные, записанные на это устройство, просто «исчезают».
echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null

echo "FTP started on :21"
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf