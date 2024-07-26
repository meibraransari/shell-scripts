#!/bin/bash

# Check if script is run as root
if [ "$(id -u)" -ne "0" ]; then
  echo "This script must be run as root."
  exit 1
fi

# Check if the username argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

USERNAME="$1"

# Create the user
useradd -m -s /bin/bash "$USERNAME"
if [ $? -ne 0 ]; then
  echo "Failed to create user $USERNAME."
  exit 1
fi

# Set a default password for the user (can be changed later)
echo "$USERNAME:password" | chpasswd

# Add the user to the sudo group
usermod -aG sudo "$USERNAME"
if [ $? -ne 0 ]; then
  echo "Failed to add $USERNAME to sudo group."
  exit 1
fi

# Create a sudoers file for no-password sudo
SUDOERS_FILE="/etc/sudoers.d/${USERNAME}_nopass"
echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" > "$SUDOERS_FILE"
if [ $? -ne 0 ]; then
  echo "Failed to create sudoers file for $USERNAME."
  exit 1
fi

# Set appropriate permissions for the sudoers file
chmod 440 "$SUDOERS_FILE"

echo "User $USERNAME created and configured with sudo privileges without password prompt."
