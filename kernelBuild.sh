# do not run this directly -- read properly
# ubuntu 18.04.1 and kernel 4.20
# run the follwoing commands in your host system
sudo apt-get install bridge-utils

#create a bridge in your system : for example, name of your bridge br0 (check online resouce for static as well as dhcp)
#(no need of disbling network-manager etc : simply change the follwing file)
#create bridge using the file : /etc/network/interfaces
#just after the change : reboot the system
#the brdige should work

# till now you have a bridge: which your new vm can use it to get internet connection and get a IITB network IP

# run the follwoing command in your host system to install kvm qemu etc for virtualization setup.
sudo apt-get install qemu-kvm libvirt-bin virtinst bridge-utils cpu-checker
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo apt-get install virt-manager

#now you have kvm and qemu installted : you can proceed to install a new VM. 
# run sudo virt-manager and create a new VM (ubuntu desktop or server)
#allocate more ram like 3 or 4gb and 2/4 cores(it will make kernel compile faster later). 
# (you may reduce these allocation later)
#use br0 bridge as your network connection point

#Now you have a ubuntu machine available insie kvm-qemu setup
#============================================================================================
# run the follwoing commands in your guest system
# start the ubuntu vm and log in.
# you should get an IP address by now.
# connect to iitb internet using your ldap (you might have to use some tools,wget ot culr or browser(in desktop ubuntu only))

# Now Just install the following as listed

sudo apt-get update
sudo apt-get -y install bison # kernel dependency
sudo apt-get -y install flex # kernel dependency
sudo apt -y install tasksel
sudo tasksel install openssh-server # will be usefull for ssh from host
sudo apt -y install ssh # will be usefull for ssh from host
sudo apt-get -y install libelf-dev # some stack-protection flag dependency requirement
sudo apt-get -y install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.20.tar.xz #link might change please check once
tar -xvf linux-4.20.tar.xz
cd linux-4.20
cp /boot/config-$(uname -r) .config # We are copying thr entire existing config file now, minimal config will be added later
make menuconfig
sudo make -j 4 # 4 or 8 cores depending on you system
sudo make modules_install -j 4 # 4 or 8 cores depending on you system
sudo make install -j 4 # 4 or 8 cores depending on you system
update-initramfs -c -k 4.20.0
update-grub  
sudo reboot

# next boot migh be slow,8-9 mins, if it happens, you might want to do the following.

nano /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash noresume"
sudo update-grub
sudo reboot
