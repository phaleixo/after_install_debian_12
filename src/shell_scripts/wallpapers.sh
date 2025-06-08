#!/usr/bin/env bash

### Initial message
echo -e "\n       ############################################################"
echo -e "       #          Install and configure Wallpapers            #"
echo -e "       ############################################################ \n"
echo "For more information, visit the project link:"
echo "https://github.com/phaleixo/after_install_debian_12"

### Confirm script execution
read -p "Do you want to proceed? (y/n): " response
[[ "$response" != "y" ]] && echo "Operation canceled by the user." && exit 0

### Check if the distribution is Debian 12 (Bookworm)
if [[ $(lsb_release -is) != "Debian" ]] || [[ $(lsb_release -cs) != "bookworm" ]]; then
    echo -e "\e[31;1mThis script is designed for Debian 12 (Bookworm) only.\e[m"
    exit 1
else
    echo ""
    echo -e "\e[32;1mDebian 12 (Bookworm) detected.\e[m"
    echo ""
fi

### Check internet connection
if ! ping -q -c 3 -W 1 1.1.1.1 >/dev/null; then
    echo -e "\e[31;1mNo internet connection. Please check your network.\e[m"
    exit 1
else
    echo -e "\e[32;1mInternet connection OK.\e[m"
fi

clear

### Install required packages if missing
if ! command -v wget &> /dev/null; then
    echo "Installing wget..."
    sudo apt update && sudo apt install -y wget
fi

if ! command -v unzip &> /dev/null; then
    echo "Installing unzip..."
    sudo apt update && sudo apt install -y unzip
fi

### Download wallpapers
echo "Downloading wallpapers..."
wget -O my_wallpapers.xml "https://github.com/phaleixo/after_install_debian_12/raw/main/src/my_wallpapers.xml"
wget -O wallpapers.zip "https://github.com/phaleixo/after_install_debian_12/raw/main/src/wallpapers.zip"

if [[ $? -ne 0 ]]; then
    echo -e "\e[31;1mFailed to download wallpapers.\e[m"
    exit 1
fi

### Extract wallpapers
echo "Extracting wallpapers..."
unzip -q wallpapers.zip -d ~/

### Detect desktop environment
DE=""
if [[ $XDG_CURRENT_DESKTOP == *"GNOME"* ]]; then
    DE="gnome"
elif [[ $XDG_CURRENT_DESKTOP == *"XFCE"* ]]; then
    DE="xfce"
else
    # Fallback detection for Debian
    if pgrep -x "gnome-session" > /dev/null; then
        DE="gnome"
    elif pgrep -x "xfce4-session" > /dev/null; then
        DE="xfce"
    fi
fi

### Install wallpapers according to DE
case $DE in
    "gnome")
        echo "Installing for GNOME..."
        sudo mv ~/wallpapers /usr/share/backgrounds/
        sudo mv my_wallpapers.xml /usr/share/gnome-background-properties/
        
        # Set wallpaper
        gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/wallpapers/21.jpg'
        gsettings set org.gnome.desktop.background picture-uri-dark 'file:///usr/share/backgrounds/wallpapers/21.jpg'
        ;;
    "xfce")
        echo "Installing for XFCE..."
        sudo mv ~/wallpapers /usr/share/images/desktop-base/
        
        # Set wallpaper for all monitors
        for monitor in $(xfconf-query -c xfce4-desktop -l | grep last-image); do
            xfconf-query -c xfce4-desktop -p $monitor -s /usr/share/xfce4/backdrops/wallpapers/21.jpg
        done
        ;;
    *)
        echo "Unknown desktop environment. Installing to common location..."
        sudo mv ~/wallpapers /usr/share/backgrounds/
        ;;
esac

### Clean up
rm -f wallpapers.zip

echo -e "\e[32;1mWallpapers installed successfully!\e[m"
exit 0
