#!/bin/sh
#
# Setup Beaker test environment for puppet-module-keycloak

sudo apt-get update

# Prepare for PDK
wget https://apt.puppet.com/puppet-tools-release-bionic.deb
sudo dpkg -i puppet-tools-release-bionic.deb

# Prepare for Docker
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install
sudo apt-get -y install pdk
sudo apt-get -y install docker-ce docker-ce-cli containerd.io

# Grant docker permissions to vagrant user
usermod -a -G docker vagrant
