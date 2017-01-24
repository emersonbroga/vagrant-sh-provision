#!/bin/bash
# install Mysql
if which mysql >/dev/null; then
  echo "Mysql already installed"
  mysql --version
else
  echo "Installing Mysql"
  sudo apt-get -y install mysql-server-5.7
  echo "Mysql installed"
  mysql --version
fi