#!/bin/bash

# install PHP
if which node >/dev/null; then
  echo "Node.js already installed"
  node -v
  npm -v
else
  echo "Installing Node.js"
  apt-get -f install 
  curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
  sudo bash nodesource_setup.sh
  sudo apt-get install nodejs -y
  sudo apt-get install build-essential -y
  rm nodesource_setup.sh
  echo "Node.js installed"
  node -v
  npm -v
fi