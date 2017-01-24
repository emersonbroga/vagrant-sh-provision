#!/bin/bash

# install Essentials
echo "Installing essentials"
sudo apt-get update
sudo apt-get -f install -y
sudo apt-get install tar
sudo dpkg-reconfigure tzdata
sudo /etc/init.d/cron stop
sudo /etc/init.d/cron start
cd ~
echo "export LC_CTYPE=\"en_US.UTF-8\"" > .bashrc
echo "export VISUAL=vim" > .bashrc
source .bashrc