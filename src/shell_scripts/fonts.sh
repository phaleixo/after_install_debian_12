#!/usr/bin/env bash

### Initial message
echo -e "\n       ############################################################"
echo -e "       #              Install and configure Fonts            #"
echo -e "       ############################################################ \n"
echo "For more information, visit the project link:"
echo "https://github.com/phaleixo/after_install_debian_12"

### Confirm script execution
read -p "Do you want to proceed? (y/n): " response
[[ "$response" != "y" ]] && inform "Operation canceled by the user." && exit 0

### check if the distribution is compatible
if [[ $(lsb_release -cs) = "bookworm" ]]
then
	echo ""
	echo -e "\e[32;1mDebian 12 Distribution.\e[m"
	echo ""
	echo "Continuing with the script..."
	echo ""
else
	echo -e "\e[31;1mDistribution not approved for use with this script.\e[m"
	exit 1
fi

### check if there is an internet connection.
if ping -q -c 3 -W 1 1.1.1.1 >/dev/null;
then
  	echo ""
	echo -e "\e[32;1mInternet connection OK.\e[m"
	echo ""
	echo "Continuing with the script..."
	echo ""
else
  	echo -e "\e[31;1mYou are not connected to the internet. Check your network or Wi-Fi connection before proceeding.\e[m"
	exit 1
fi

clear
mkdir -p ~/.fonts

wget --version > /dev/null

if [[ $? -ne 0 ]]; then
        echo "wget not available , installing"
        sudo apt update && sudo apt install wget -y
fi

unzip >> /dev/null

if [[ $? -ne 0 ]]; then
        echo "unzip not available , installing"
        sudo apt update && sudo apt install unzip -y
fi


wget -O fonts.zip "https://github.com/mozilla/Fira/archive/refs/tags/4.202.zip"

wget -O firacode.zip "https://github.com/tonsky/FiraCode/releases/download/1.204/FiraCode_1.204.zip"

wget -O FontsForDesign.zip "https://github.com/phaleixo/after_install_debian_12/blob/main/src/Fonts%20for%20design.zip"


if [[ $? -ne 0 ]]; then
        echo "Downloading failed , exiting"
        exit 1
fi

unzip fonts.zip -d ~/.fonts
unzip firacode.zip -d ~/.fonts
unzip FontsForDesign.zip -d ~/.fonts

clear
echo "purging fonts cache "
sudo fc-cache -v -f
clear
echo "Done"
sleep 2
clear
echo "Setting default fonts "

gsettings set org.gnome.desktop.interface document-font-name 'Fira Sans Regular 11'
gsettings set org.gnome.desktop.interface font-name 'Fira Sans Regular 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Code Regular 11'
gsettings set org.gnome.nautilus.desktop font 'Fira Sans Regular 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Fira Sans SemiBold 12"
clear

rm -rf fonts.zip
rm -rf firacode.zip
rm -rf FontsForDesign.zip

echo -e "Fonts installed"

exit 0
