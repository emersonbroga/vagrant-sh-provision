#!/bin/bash

# install PHP
if which sails >/dev/null; then
  echo "Sails.js already installed"
  sails -version
else
  echo "Installing Sails.js"
  sudo npm install sails -g
  echo "Sails.js installed"
  sails -version
fi