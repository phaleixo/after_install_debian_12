#!/usr/bin/env bash

# Function to display informative messages
function inform {
    echo "==================================================================="
    echo "$1"
    echo "==================================================================="
}

# Initial message
echo -e "\n       ############################################################"
echo -e "       # Switch Radeon to Amdgpu on Debian-based distros.         #"
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

# Check video driver
video_driver_info=$(lspci -k | grep amdgpu)
video_card_info=$(lspci | grep VGA)

if [[ "$video_driver_info" == *"Kernel driver in use: amdgpu"* ]]; then
    # Amdgpu driver is already active
    inform "Video card: '$video_card_info'\n----------------------------------------------------------------" "success"
    inform "The amdgpu driver is already active. No action required." "success"
elif [[ "$video_driver_info" == *"Kernel driver in use: radeon"* ]]; then
    # Switch from radeon to amdgpu
    inform "Video card: '$video_card_info'\n----------------------------------------------------------------" "success"
    inform "Switching driver from radeon to amdgpu..."
    sed_command='s/GRUB_CMDLINE_LINUX_DEFAULT="\(.*\)"/GRUB_CMDLINE_LINUX_DEFAULT="\1 radeon.cik_support=0 amdgpu.cik_support=1 radeon.si_support=0 amdgpu.si_support=1"/'

    if sudo sed -i "$sed_command" /etc/default/grub && sudo update-grub; then
        inform "Driver configuration updated successfully. Restart the system to apply the changes." "success"
    else
        inform "Error updating GRUB or changing the driver. Please restart the system manually after fixing the issue." "error"
    fi
else
    # No AMDGPU or Radeon driver detected
    inform "Video card: '$video_card_info'" "error"
    inform "Unable to detect the AMDGPU or Radeon video driver on the system." "error"
fi

echo -e "Change Drive Completed, please restart the PC"

exit 0

