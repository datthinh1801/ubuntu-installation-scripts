#!/bin/bash

# Get the path to the hard disk
read -p "Enter the path to the hard disk (e.g., /dev/sda, /dev/nvme0n1): " hard_disk

# Get the LVM group from the user
read -p "Enter the LVM group (e.g., ubuntu-vg): " LVM_group

# Get the logical volume name from the user
read -p "Enter the logical volume (e.g., ubuntu-lv): " logical_volume

# Reformat the hard disk for LVM
pvcreate "$hard_disk"

# Add the hard disk to the volume group to extend the group
vgextend "$LVM_group" "$hard_disk"

# Extend the logical volume with the new available space
lvextend -l +100%FREE "/dev/$LVM_group/$logical_volume"

# Resize the filesystem
resize2fs "/dev/$LVM_group/$logical_volume"
