#!/bin/bash

# install Apache
if which apache2 >/dev/null; then
  echo "Apache already installed"
  apache2 -v
else
  echo "Installing Apache"
  sudo apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y
  sudo a2enmod rewrite
  echo "Apache installed"
  apache2 -v
fi