# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "beaker" do |box|
    box.vm.box = "ubuntu/bionic64"
    box.vm.box_version = "20210119.1.0"
    box.vm.hostname = "beaker.local"
    box.vm.network "private_network", ip: "192.168.58.82"
    box.vm.synced_folder "../puppet-module-keycloak", "/home/vagrant/puppet-module-keycloak", type: "virtualbox"
    box.vm.provision "shell", path: "beaker.sh"
    box.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = 3072
    end
  end
end
