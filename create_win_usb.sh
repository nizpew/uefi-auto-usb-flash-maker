#!/bin/bash

# Set the USB device path here
USB_DEVICE="/dev/sda"


lsblk | tail
echo "Are you certain that your flash USB is $USB_DEVICE?"
echo "IF YES, PRESS ENTER to continue."
echo "If not, please edit this script to the correct device path and run again."

read -p "Press Enter to continue..."

# Confirm ISO path (set this variable to your ISO file location)
ISO_PATH=~/Downloads/Win10_21H1_English_x64.iso



echo "Listing block devices:"
lsblk

echo "Wiping filesystem signatures on $USB_DEVICE..."
sudo wipefs -a "$USB_DEVICE"

echo "Creating new partition table and partition on $USB_DEVICE..."
sudo parted "$USB_DEVICE" --script mklabel msdos
sudo parted "$USB_DEVICE" --script mkpart primary fat32 1MiB 100%

echo "Formatting the new partition as FAT32..."
sudo mkfs.fat -F32 "${USB_DEVICE}1"

echo "Creating mount point for USB..."
sudo mkdir -p /media/usb

echo "Mounting ${USB_DEVICE}1 to /media/usb..."
sudo mount "${USB_DEVICE}1" /media/usb

echo "Creating mount point for ISO..."
sudo mkdir -p /mnt/iso

echo "Mounting ISO $ISO_PATH to /mnt/iso..."
sudo mount -o loop "$ISO_PATH" /mnt/iso

echo "Copying files from ISO to USB..."
sudo cp -rT /mnt/iso/ /media/usb/
sudo sync

echo "Done copying. Please wait about 8 minutes for all operations to complete."

