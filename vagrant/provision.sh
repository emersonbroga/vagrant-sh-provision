#!/bin/bash
SITE_DOMAIN="terraqueos.local"


# update
echo "===Updating....==="
apt-get update

# install the default things
echo "===Install the default stuff...==="
apt-get install -y php5 php5-cli php5-xdebug php5-mysql phpunit php-apc php5-imagick php5-mcrypt php5-memcache php5-suhosin php-pear curl imagemagick php5-dev php5-curl php5-sqlite libapache2-mod-php5 apache2 memcached vim git-core subversion

# install the mysql
echo "===Install Mysql...==="
export DEBIAN_FRONTEND=noninteractive
apt-get -q -y install mysql-server

# set the mysql root password to root
echo "===Set Mysql root password...==="
mysqladmin -u root password root



# mod rewrite
echo "===Install mod rewrite...==="
a2enmod rewrite



# set the locale
echo "===Go to home directory and set locale...==="
cd ~
echo "export LC_CTYPE=\"en_US.UTF-8\"" > .bashrc
echo "export VISUAL=vim" > .bashrc
source .bashrc


#site config
echo "===Set site config...==="
sudo su
if [ -e "/etc/apache2/sites-available/${SITE_DOMAIN}.conf" ]; then
    rm /etc/apache2/sites-available/${SITE_DOMAIN}.conf
fi

cat > /etc/apache2/sites-available/${SITE_DOMAIN}.conf <<EOF
<VirtualHost *:80>
        ServerAdmin admin@${SITE_DOMAIN}
        ServerName ${SITE_DOMAIN}
        ServerAlias www.${SITE_DOMAIN}
        
        DocumentRoot /var/www/${SITE_DOMAIN}/public
        <Directory /var/www/${SITE_DOMAIN}/public>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                Order allow,deny
                allow from all
        </Directory>
        ErrorLog ${APACHE_LOG_DIR}/${SITE_DOMAIN}-error.log
        CustomLog ${APACHE_LOG_DIR}/${SITE_DOMAIN}-access.log combined

</VirtualHost>
EOF

if [ -e "/etc/apache2/sites-enabled/${SITE_DOMAIN}.conf" ]; then
    echo "===Site already enabled...==="
else    
    echo "===Enable site...==="
    a2dissite /etc/apache2/sites-available/default
    a2ensite /etc/apache2/sites-available/${SITE_DOMAIN}.conf
fi

echo "===Enable vhost==="

echo "ServerName localhost" > /etc/apache2/apache2.conf 
#echo "${hostname}" > /etc/hostname
echo "127.0.0.1 localhost.localdomain localhost" > /etc/hosts
echo "127.0.1.1 ${hostname}" >> /etc/hosts
echo "127.0.0.1 ${SITE_DOMAIN}" >> /etc/hosts
echo "Listen 127.0.0.1:80" > /etc/apache2/ports.conf

echo "===Create site dir...==="
mkdir -p /var/www/${SITE_DOMAIN}/public

echo "===Create site index...==="
echo "Hello world, ${SITE_DOMAIN}" > /var/www/${SITE_DOMAIN}/public/index.html

echo "===Change site owner...==="
chown -R www-data:www-data /var/www/${SITE_DOMAIN}

echo "===Check for custom configs...==="
if [ -e "/var/www/vagrant/${SITE_DOMAIN}.sh" ]; then
    echo "Start custom scripts..."
    sudo sh /var/www/vagrant/${SITE_DOMAIN}.sh
fi

sudo /etc/init.d/apache2 restart
echo "=== READY MY MASTER ==="

