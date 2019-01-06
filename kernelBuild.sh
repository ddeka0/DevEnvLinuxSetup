#!/bin/bash
sudo apt-get update
sudo apt-get -y install bison
sudo apt-get -y install flex
sudo apt -y install tasksel
sudo tasksel install openssh-server
sudo apt -y install ssh
sudo apt-get -y install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.20.tar.xz
tar -xvf linux-4.20.tar.xz
cd linux-4.20
cp /boot/config-$(uname -r) .config
make menuconfig
