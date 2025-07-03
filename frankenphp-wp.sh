#!/bin/bash
#author : Anggarda Saputra Wijaya. anggarda.wijaya@outlook.com. github.com/anggardawjy
#version : 0.1
#about : FrankenPHP - Wordpress
#
#======== Update Repository & Package =======#
apt update && upgrade -y
apt install curl unzip htop -y
#
#
#======== Install Go Languange ========#
wget -c https://go.dev/dl/go1.24.4.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.24.4.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
source ~/.bashrc
rm go1.24.4.linux-amd64.tar.gz
#
#
#======== Install FrankenPHP ========#
curl https://frankenphp.dev/install.sh | sh
mv frankenphp /usr/local/bin/
#
#
#======== Install Wordpress Lastest Update ========#
mkdir /home/www
cd /home/www
wget https://wordpress.org/latest.zip
unzip latest.zip
rm latest.zip
mv wordpress html
chown -R root:root /home/www
#
#
#======== Install and Configure MYSQL Server ========#
apt install mysql-server -y
echo "   ==============================================   ";
echo "                SETUP DATABASE MYSQL                ";
echo "   ==============================================   ";
echo "                                                    ";
echo -n "Create Username MYSQL : "
read usernamemysql
echo -n "Create Password MYSQL : "
read passwordmysql
echo -n "Create Database For Wordpress : "
read databasename
echo "                                                    ";
echo "   ==============================================   ";
echo "                                                    ";
mysql -e "ALTER USER '$usernamemysql'@'localhost' IDENTIFIED WITH mysql_native_password BY '$passwordmysql';"
mysql -u$usernamemysql -p$passwordmysql -e "GRANT ALL PRIVILEGES ON $usernamemysql.* TO '$usernamemysql'@'localhost';"
mysql -u$usernamemysql -p$passwordmysql -e "CREATE DATABASE $databasename;"
echo "   ==============================================   ";
#
#
#======== Configure Caddyfile ========#
mkdir /etc/caddy
cp support/Caddyfile /etc/caddy/Caddyfile
chown -R root:root /etc/caddy
#
#
#======== Configure FrankenPHP Service ========#
cp support/frankenphp.service /etc/systemd/system/frankenphp.service
systemctl daemon-reload
systemctl enable --now frankenphp
systemctl restart frankenphp.service
systemctl status frankenphp.service
#
#
