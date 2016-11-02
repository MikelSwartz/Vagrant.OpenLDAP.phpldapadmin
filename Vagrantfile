# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
#  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.box = "bmcgonigle/centos68"
  config.vm.hostname = "ldapdev.opengoodies.com"
  config.vm.provision "shell", path: "provision.sh"
#  config.vm.network "forwarded_port", guest: 389, host: 3890
  config.vm.network "forwarded_port", guest: 80, host: 8010

end
