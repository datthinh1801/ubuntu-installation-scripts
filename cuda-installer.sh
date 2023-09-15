#! /bin/bash

sudo apt update && sudo apt upgrade
sudo apt autoremove nvidia* --purge
sudo ubuntu-drivers autoinstall
sudo reboot

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda
