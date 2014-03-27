#!/bin/bash
SITE_DOMAIN="terraqueos.local"

if [ -e "/var/www/${SITE_DOMAIN}/public/index.php" ]; then
    echo "Site configurated..."
else    

    cd /var/www/${SITE_DOMAIN}

    rm -rf public

    wget https://github.com/emersonbroga/laravel-bootstrap/archive/master.zip && unzip master.zip && rm master.zip && mv laravel-bootstrap-master/* ./ && rm -rf laravel-bootstrap-master/

    wget https://getcomposer.org/composer.phar && php composer.phar --no-dev install
fi

