# Compile the same version of the kernel (in the host)
# because our host and guest architecture are same.
# if guest architecture is different, compile the kernel
# in the guest and transfer entire linux-build folder to host.

steps for compiling the kernel-------------------------- 
# sudo make -j 8
# sudo make modules -j 8
# but do not make install (do not install)
# do not run this script automatially
=========================================================
# save this command as run_qemu.sh
sudo qemu-system-x86_64									\
	-s 													\
	-S 													\
	-smp 2												\
	-m 3000M 											\
	# -show-cursor										\
	# qemu-system-arm -M overo -m 256 -sd ./test.img 	\
	# -clock unix -serial stdio -usb -device usb-host,	\
	# hostbus=2,hostaddr=1								\
	-hda /var/lib/libvirt/images/<disk_file_name> 		\
	# check the existing vm disk file name in host 		\
	# that you have installed using virt-manager		\
	# for example ubuntu18.04.qcow2						\
	-enable-kvm											\
	-kernel arch/x86/boot/bzImage 						\
	-append "root=/dev/sda1 console=tty0 nokaslr"
=========================================================

=========================================================
# save this command as run_gdb.sh
sudo gdb ./vmlinux  									\
			-ex "target remote localhost:1234"       	\
            -ex "break x86_64_start_kernel"				\
           	-ex "continue"								\
          	# press ctrl+c after VM boots up			\
           	-ex "disconnect"							\
           	-ex "set architecture i386:x86-64:intel"	\
           	-ex "target remote localhost:1234"
=========================================================

# copy these sh files inside linux kernel build folder in the host

#steps to be followed inside the host machine.

1. go the the linux build folder
2. run the qemu script (vm will stop in between)
3. now run the gdb script (vm will continue booting)
4. wait for complete booting and after that press ctrl+c in the gdb terminal
5. you can now delete existing breakpoints and set new breakpoints
6. gdb "win" command is usefull to view the kernel code line-by-line


# Similar process worked for ubuntu 16.04 and kernel version 4.13.11
# https://www.youtube.com/watch?v=wCf0ouJSuZ4

more information -----------------------------------------
# https://stackoverflow.com/questions/11408041/how-to-debug-the-linux-kernel-with-gdb-and-qemu
# https://stackoverflow.com/questions/19665412/mouse-and-keyboard-not-working-in-qemu-emulator
# https://askubuntu.com/questions/730891/how-can-i-get-a-mouse-cursor-in-qemu
