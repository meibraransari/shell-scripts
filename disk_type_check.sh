#!/bin/bash
# Initialize an array to store disk names
disks=()
# Iterate over directories under /sys/block/
for disk_path in /sys/block/*; do
    # Extract the disk name from the path
    disk=$(basename "$disk_path")
    # Skip disks named 'loop'
    if [[ $disk == loop* ]]; then
        continue
    fi
    # Add the disk name to the array
    disks+=("$disk")
done
# Iterate through the disks array and determine disk type
for disk in "${disks[@]}"; do
    rotational=$(<"/sys/block/$disk/queue/rotational")
    if [ "$rotational" -eq 0 ]; then
        echo "$disk disk is: SSD"
    else
        echo "$disk disk is: HDD"
    fi
done
