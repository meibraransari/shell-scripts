#!/bin/bash
# upgrade kernal linux
# Get the current kernel version
CURRENT_KERNEL=$(uname -r)

# Update the package list and upgrade installed packages
sudo apt update
sudo apt upgrade -y

# Install the latest available kernel
sudo apt install --install-recommends linux-generic-hwe-$(lsb_release -cs) -y

# Get the updated kernel version
UPDATED_KERNEL=$(dpkg -l | grep linux-image | awk '{print $2}' | tail -n1)

# Print a message with the current and updated kernel versions
echo "Kernel has been updated from $CURRENT_KERNEL to $UPDATED_KERNEL. Please reboot your system to apply the changes."
