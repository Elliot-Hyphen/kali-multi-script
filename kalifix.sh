#!/bin/bash
PS3='Please select your choice: '
options=("Fix Wifi Problems" "Update OS" "Install Kali-tools" "Clean System")
select opt in "${options[@]}"
do
    case $opt in
        "Fix Wifi Problems")
            echo " Please DONT Panic if your system Reboots! ..."
            sudo apt-get update
            sudo apt-get upgrade -y ; sudo apt-get dist-upgrade -y
            apt-get install linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') broadcom-sta-dkms -y
            sudo modprobe -r b44 b43 b43legacy ssb brcmsmac bcma
            sudo modprobe wl
echo "Rebooting..... <:)" 
reboot
            
;;
  "Update OS")
echo "Updating...."
        sudo apt-get update ; sudo apt-get upgrade -y ; sudo apt-get dist-upgrade -y 
clear
echo "!!!SYSTEM UPDATED!!!"
lsb_release -a   
echo "!!!SYSTEM UPDATED!!!"

;;
  "Install Kali-Tools") 
echo "Installing Kali-Linux Tools"
	break
	sudo apt-get update && sudo apt-get upgrade -y 
	sudo apt-get install kali-linux-all -y
echo "Rebooting..."	
	sudo reboot
            
;;
  "Clean System") 
	sudo apt-get autoclean -y ; sudo apt-get autoremove -y
echo " Installing Bleachbit.... Please Wait!"
	sudo apt-get install bleachbit -y
	sudo bleachbit

  "Quit")
	clear
	break
	
;;
  *) echo invalid option;;
	esac
	done

