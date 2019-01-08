# do not run this directly -- read propery
# ubuntu 18.04.1 and kernel 4.20
sudo apt-get install bridge-utils

#create a bridge in your system : for example name of your bridge br0

#after that,

sudo apt-get install qemu-kvm libvirt-bin virtinst bridge-utils cpu-checker
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo apt-get install virt-manager
sudo virt-manager # create a new virtual machine Assuming you have already downloaded one ubuntu image

#Once you are inside the ubuntu VM (guest) for the first time : not upgrade anything : no package manager stuff (popup etc)

#Just install the following as listed

sudo apt-get update
sudo apt-get -y install bison
sudo apt-get -y install flex
sudo apt -y install tasksel
sudo tasksel install openssh-server
sudo apt -y install ssh
sudo apt-get -y install libelf-dev
sudo apt-get -y install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.20.tar.xz
tar -xvf linux-4.20.tar.xz
cd linux-4.20
cp /boot/config-$(uname -r) .config
make menuconfig
sudo make -j 4 && sudo make modules_install -j 4 && sudo make install -j 4
update-initramfs -c -k 4.20.0
update-grub  
sudo reboot

nano /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash noresume"
sudo update-grub
sudo reboot
