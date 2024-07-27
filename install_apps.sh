#!/usr/bin/env bash

# Initial message
echo -e "\n       ############################################################"
echo -e "       #                   Unnecessary Apps Remover.              #"
echo -e "       ############################################################ \n"
echo "For more information, visit the project link:"
echo "https://github.com/phaleixo/after_install_debian_12"

# Confirm script execution
read -p "Do you want to proceed? (y/n): " response
[[ "$response" != "y" ]] && inform "Operation canceled by the user." && exit 0

### check if the distribution is compatible
if [[ $(lsb_release -cs) = "bookworm" ]]
then
	echo ""
	echo ""
	echo -e "\e[32;1mDebian 12 Distribution.\e[m"
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
	echo ""
	echo -e "\e[32;1mInternet connection OK.\e[m"
	echo "Continuing with the script..."
	echo ""
else
  	echo -e "\e[31;1mYou are not connected to the internet. Check your network or Wi-Fi connection before proceeding.\e[m"
	exit 1
fi

# Check for sudo privileges
sudo -v || (inform "sudo may not be installed or the user may not have sudo permissions." && exit 1)

# Instalar aplicativos Flatpak
flatpak=(
	org.gimp.GIMP
	org.gimp.GIMP.Plugin.Resynthesizer/x86_64/2-40
	org.inkscape.Inkscape 
	org.gnome.Builder
	ar.xjuan.Cambalache 
	re.sonny.Workbench
	org.DolphinEmu.dolphin-emu
	com.getpostman.Postman
	com.github.tchx84.Flatseal
	com.usebottles.bottles
	com.bitwarden.desktop
	de.haeckerfelix.Fragments
	org.sqlitebrowser.sqlitebrowser
)

for nome_do_flatpak in "${flatpak[@]}"; do
  if ! flatpak list | grep -q "$nome_do_flatpak"; then
    sudo flatpak install flathub --system "$nome_do_flatpak" -y
  fi
done

## Instalar Vscode from repository

sudo apt-get install wget gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https -y
sudo apt update
sudo apt install code -y

## Installing ONLYOFFICE Desktop Editors from repository

mkdir -p -m 700 ~/.gnupg
gpg --no-default-keyring --keyring gnupg-ring:/tmp/onlyoffice.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
chmod 644 /tmp/onlyoffice.gpg
sudo chown root:root /tmp/onlyoffice.gpg
sudo mv /tmp/onlyoffice.gpg /usr/share/keyrings/onlyoffice.gpg

echo 'deb [signed-by=/usr/share/keyrings/onlyoffice.gpg] https://download.onlyoffice.com/repo/debian squeeze main' | sudo tee -a /etc/apt/sources.list.d/onlyoffice.list

sudo apt-get update

sudo apt-get install onlyoffice-desktopeditors

### Change gnome-terminal to gnome-console

sudo apt install gnome-console -y &&  sudo apt remove gnome-terminal -y  

echo -e "Instaled apps"

exit 0
