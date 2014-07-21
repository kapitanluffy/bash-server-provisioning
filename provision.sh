#!/bin/sh
add-apt-repository -y ppa:ondrej/php5
apt-get update
apt-get install -y apache2 
apt-get install -y mysql-server mysql-client
apt-get install -y php5 libapache2-mod-php5 php5-mcrypt php5-curl php5-mysql
apt-get -y install git-core vim phpmyadmin

if [ ! -f /etc/apache2/mods-enabled/rewrite.load ] ; then
    a2enmod rewrite
fi

/usr/bin/mysql_secure_installation
service apache2 restart

useradd www-man
echo -e "changepassword\nchangepassword\n" | passwd www-man
