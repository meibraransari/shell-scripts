#!/bin/bash

# Function to create udev rule
create_udev_rule() {
    echo 'ACTION=="add|change", KERNEL=="vda", ATTR{queue/rotational}="0"' > /etc/udev/rules.d/60-ssd.rules
    udevadm control --reload-rules
    udevadm trigger
}

# Function to check and verify if the rule is applied
verify_rule() {
    if [ "$(cat /sys/block/vda/queue/rotational)" == "0" ]; then
        echo "The udev rule has been applied successfully."
    else
        echo "Failed to apply the udev rule."
    fi
}

# Detect the Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
elif [ -f /etc/centos-release ]; then
    OS=centos
elif [ -f /etc/redhat-release ]; then
    OS=rhel
else
    echo "Unsupported Linux distribution."
    exit 1
fi

echo "Detected OS: $OS"

# Install necessary packages if missing
install_packages() {
    case "$OS" in
        ubuntu|debian)
            apt-get update
            apt-get install -y udev
            ;;
        rocky|almalinux|centos|rhel)
            yum install -y systemd-udev
            ;;
        *)
            echo "This script does not support the detected Linux distribution: $OS."
            exit 1
            ;;
    esac
}

install_packages
create_udev_rule
verify_rule
