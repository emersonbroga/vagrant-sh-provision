#!/bin/bash
DB_USER=root
DB_PASS=root
# install Mysql
if which mysql >/dev/null; then
  echo "Mysql already installed"
  mysql --version
else
  echo "Installing Mysql"
  sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password $DB_USER'
  sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password $DB_USER'
  sudo apt-get -y install mysql-server-5.7
  echo "Mysql installed"
  mysql --version
fi