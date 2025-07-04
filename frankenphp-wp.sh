#!/bin/bash
#author : Anggarda Saputra Wijaya. anggarda.wijaya@outlook.com. github.com/anggardawjy
#version : 0.5
#about : FrankenPHP - Wordpress
#
#======== Initiation Package =======#
apt update && upgrade -y
apt install curl unzip htop mysql-server -y
mkdir /home/www
chown -R root:root /home/www
mkdir /etc/caddy
touch /etc/caddy/Caddyfile
chmod -R 777 /etc/caddy/
cp support/Caddyfile /etc/caddy/
chown -R root:root /etc/caddy
touch /etc/systemd/system/frankenphp.service
chmod -R 777 /etc/systemd/system/
cp support/frankenphp.service /etc/systemd/system/
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
#======== Install Wordpress ========#
cd /home/www
wget https://wordpress.org/latest.zip
unzip latest.zip
rm latest.zip
mv wordpress html
chmod -R 777 html
#
#
#======== Configure MYSQL Server ========#
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
mysql -u$usernamemysql -p$passwordmysql -e "SHOW DATABASES;"
echo "                                                    ";
echo "   ==============================================   ";
#
#
systemctl daemon-reload
systemctl enable --now frankenphp
systemctl restart frankenphp.service
systemctl status frankenphp.service
#
#
