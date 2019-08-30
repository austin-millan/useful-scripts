#!/bin/bash

# Reboots into Windows OS upon restart. Note: you may have to use `grub`
# instead of `grub2`


# ******************************************************************
# reboot directly to windows 
#   Inspired by http://askubuntu.com/questions/18170/how-to-reboot-into-windows-from-ubuntu
#   https://unix.stackexchange.com/questions/43196/how-can-i-tell-grub-i-want-to-reboot-into-windows-before-i-reboot
# ******************************************************************
my_reboot_to_windows() {
    WINDOWS_TITLE=`grep -i 'windows' /boot/grub2/grub.cfg|cut -d"'" -f2`
    sudo grub2-reboot "$WINDOWS_TITLE"
    sudo reboot
}

my_reboot_to_windows

