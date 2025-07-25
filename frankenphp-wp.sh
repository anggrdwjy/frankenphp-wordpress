#!/bin/bash
#author : Anggarda Saputra Wijaya. anggarda.wijaya@outlook.com. github.com/anggardawjy
#version : 0.5
#about : FrankenPHP - Wordpress
#
#======== Initiation Package =======#
apt install software-properties-common -y
apt update -y
apt install curl unzip htop mysql-server -y
mkdir /home/www
mkdir /etc/caddy/
touch /etc/caddy/Caddyfile
touch /etc/systemd/system/frankenphp.service
chown -R root:root /home/www
chown -R root:root /etc/caddy
chmod -R 755 /etc/caddy/
chmod -R 755 /etc/systemd/system/
cp support/Caddyfile /etc/caddy/
cp support/frankenphp.service /etc/systemd/system/
#
#
#======== Install Go Languange ========#
wget -c https://go.dev/dl/go1.24.4.linux-amd64.tar.gz | tar -C /usr/local -xzf go1.24.4.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc | source ~/.bashrc
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
chmod -R 755 html
mv /home/www/html/wp-config.php /home/wp-config.bak
cp support/wp-config.php /home/www/html/
#
#
#======== Configure MYSQL Server ========#
echo "   ==============================================   ";
echo "                SETUP DATABASE MYSQL                ";
echo "   ==============================================   ";
echo "                                                    ";
echo -n "Create Username MYSQL (Default Root) : "
read usernamemysql
echo "                                                    ";
echo -n "Create Password MYSQL                : "
read passwordmysql
echo "                                                    ";
echo -n "Create Database For Wordpress        : "
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
