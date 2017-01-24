#!/bin/bash

# install Composer
if which composer >/dev/null; then
  echo "Composer already installed"
  composer --version
else
  echo "Installing Composer"
  curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
  sudo chown -R $USER $HOME/.composer
  echo "Composer installed"
  composer --version
fi