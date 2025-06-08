#!/usr/bin/env bash

### Initial message
echo -e "\n       ############################################################"
echo -e "       #              Install and configure Fonts            #"
echo -e "       ############################################################ \n"
echo "For more information, visit the project link:"
echo "https://github.com/phaleixo/after_install_debian_12"

### Confirm script execution
read -p "Do you want to proceed? (y/n): " response
[[ "$response" != "y" ]] && echo "Operation canceled by the user." && exit 0

### Check if the distribution is compatible
if [[ $(lsb_release -cs) = "bookworm" ]]; then
	echo -e "\n\e[32;1mDebian 12 Distribution.\e[m\n"
else
	echo -e "\e[31;1mDistribution not approved for use with this script.\e[m"
	exit 1
fi

### Check internet connection
if ping -q -c 3 -W 1 1.1.1.1 >/dev/null; then
  	echo -e "\n\e[32;1mInternet connection OK.\e[m\n"
else
  	echo -e "\e[31;1mNo internet connection.\e[m"
	exit 1
fi

### Prepare environment
clear
mkdir -p ~/.fonts

command -v wget >/dev/null || {
	echo "wget not found, installing..."
	sudo apt update && sudo apt install wget -y
}

command -v unzip >/dev/null || {
	echo "unzip not found, installing..."
	sudo apt update && sudo apt install unzip -y
}

### Install Inter font (if not already installed)
if ! fc-list | grep -iq "Inter"; then
	echo "Installing Inter font..."
	sudo apt install fonts-inter -y
else
	echo "Inter font already installed."
fi

### Download custom fonts for design (optional)
wget -O FontsForDesign.zip "https://github.com/phaleixo/after_install_debian_12/blob/main/src/Fonts%20for%20design.zip?raw=true"
unzip FontsForDesign.zip -d ~/.fonts

### Update font cache
clear
echo "Purging fonts cache..."
fc-cache -v -f

### Set fonts based on DE
echo "Setting default fonts..."

if [[ $XDG_CURRENT_DESKTOP == *"GNOME"* ]]; then
	gsettings set org.gnome.desktop.interface document-font-name 'Inter Regular 10'
	gsettings set org.gnome.desktop.interface font-name 'Inter Regular 10'
	gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono 10'
	gsettings set org.gnome.nautilus.desktop font 'Inter Regular 10'
	gsettings set org.gnome.desktop.wm.preferences titlebar-font "Inter SemiBold 11"
	echo "Fonts set for GNOME"
elif [[ $XDG_CURRENT_DESKTOP == *"XFCE"* ]]; then
	xfconf-query -c xsettings -p /Gtk/FontName -s "Inter 10"
	xfconf-query -c xsettings -p /Gtk/MonospaceFontName -s "JetBrains Mono Regular 10"
	echo "Fonts set for XFCE"
else
	echo "Unknown desktop environment. Set fonts manually if needed."
fi

### Cleanup
rm -f FontsForDesign.zip

echo -e "\nFonts installed and configured successfully.\n"
exit 0
