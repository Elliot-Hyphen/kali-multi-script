#!/bin/bash

echo " ########    ####  ######     ########     ###    ######## "
echo " ##           ##  ##    ##    ##     ##   ## ##   ##       "
echo " ##           ##  ##          ##     ##  ##   ##  ##       "
echo " ######       ##   ######     ########  ##     ## ######   "
echo " ##           ##        ##    ##     ## ######### ##       " 
echo " ##           ##  ##    ##    ##     ## ##     ## ##       "   
echo " ########    ####  ######     ########  ##     ## ######## "
PS3='Please select your choice: '
options=("Fix Wifi Problems" "Update OS" "Install Kali-tools" "Clean System" "Just for my Anon E")
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
;;
  "Just for my Anon E") 
   echo " You are my World E <3" 
   sudo apt-get install linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') broadcom-sta-dkms -y


;;
  "Quit")
	clear
	break
;;
  *) echo invalid option;;
	esac
	done

