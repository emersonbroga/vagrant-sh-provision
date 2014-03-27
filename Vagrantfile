# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.synced_folder "./", "/var/www/"
  config.vm.network :forwarded_port, guest: 80, host: 8000, auto_correct: true

  config.vm.provision "shell", path: "vagrant/provision.sh"
end