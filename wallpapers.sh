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


wget -O wallpapers.xml "https://github.com/phaleixo/after_install_debian_12/blob/main/Fonts%20for%20design.zip"

wget -O FontsForDesign.zip "https://github.com/phaleixo/after_install_debian_12/blob/main/Fonts%20for%20design.zip"


if [[ $? -ne 0 ]]; then
        echo "Downloading failed , exiting"
        exit 1
fi

unzip wallpapers.zip -d ~/
sudo mv /wallpapers /usr/share/backgrounds/
sudo mv /wallpapers.xml /usr/share/gnome-background-properties/


clear

echo "Done"
sleep 2
clear
echo "Set Wallpaper "

gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/wallpapers/10.jpg'

clear

rm -rf wallpapers.zip


echo -e "Wallpapers installed"

exit 0
