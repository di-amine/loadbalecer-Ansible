#! /bin/bash
# echo "make new password mysql:"
# read passwd
passwd= "root"

# echo "Stop Service Mysql"

# sudo systemctl stop mysqld

echo "Copy file from /etc/my.cnf"

sudo  sed -i -e '$a\skip-grant-tables' /etc/my.cnf

echo "restart service Mysql"

sudo systemctl restart mysqld

echo "Change password root"

mysql -h 127.0.0.1 -u root -e \ "FLUSH PRIVILEGES; ALTER USER 'root'@'localhost' IDENTIFIED BY '$passwd'; exit"

echo "Stop Service Mysql"
sudo systemctl stop mysqld


sudo sed -i '$d' /etc/my.cnf


echo "Start service Mysql"
sudo systemctl start mysqld
systemctl status mysqld
