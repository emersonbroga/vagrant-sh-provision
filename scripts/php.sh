#!/bin/bash

# install PHP
if which php >/dev/null; then
  echo "PHP already installed"
  php -v
else
  echo "Installing PHP"
  sudo add-apt-repository ppa:ondrej/php -y
  sudo apt-get update
  sudo apt-get install php5.6 -y
  sudo apt-get install php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml -y
  sudo php5.6enmod mcrypt
  echo "PHP installed"
  php -v
fi