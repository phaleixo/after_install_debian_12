#!/usr/bin/env bash

### Initial message
echo -e "\n       ############################################################"
echo -e "       #           Install and configure Gnome Extensions          #"
echo -e "       ############################################################ \n"
echo "For more information, visit the project link:"
echo "https://github.com/phaleixo/after_install_debian_12"

### Confirm script execution
read -p "Do you want to proceed? (y/n): " response
[[ "$response" != "y" ]] && echo "Operation canceled by the user." && exit 0

### Check if the distribution is compatible
if [[ $(lsb_release -cs) = "bookworm" ]]; then
	echo -e "\n\e[32;1mDebian 12 Distribution.\e[m"
	echo "Continuing with the script..."
else
	echo -e "\e[31;1mDistribution not approved for use with this script.\e[m"
	exit 1
fi

### Check for internet connection
if ping -q -c 3 -W 1 1.1.1.1 >/dev/null; then
	echo -e "\n\e[32;1mInternet connection OK.\e[m"
	echo "Continuing with the script..."
else
	echo -e "\e[31;1mYou are not connected to the internet. Check your network or Wi-Fi connection before proceeding.\e[m"
	exit 1
fi

### Check if the desktop environment is GNOME
desktop_env=$(echo "$XDG_CURRENT_DESKTOP" | tr '[:upper:]' '[:lower:]')

if [[ "$desktop_env" != *gnome* ]]; then
	echo -e "\e[31;1mThis script is intended for GNOME. Detected desktop: $XDG_CURRENT_DESKTOP\e[m"
	exit 1
else
	echo -e "\e[32;1mDetected GNOME environment.\e[m"
fi

### Install Extensions
extension=( 
	gnome-shell-extension-dashtodock
	gnome-shell-extension-appindicator
	gnome-shell-extension-expresso
	gnome-shell-extension-tilling-assistant
	gnome-shell-extension-desktop-icons-ng
)

for extension_name in "${extension[@]}"; do
  if ! dpkg -l | grep -q "$extension_name"; then
    sudo apt install "$extension_name" -y
  else
    echo "[installed] - $extension_name"
  fi
done

echo -e "\n\e[32;1mExtensions installed.\e[m"

exit 0
