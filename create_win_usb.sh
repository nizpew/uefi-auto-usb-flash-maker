#!/bin/bash


cd ~/Downloads/

wget https://dn721106.ca.archive.org/0/items/win-10-21-h-1-english-x-64_20210711/Win10_21H1_English_x64.iso

cd

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





sudo apt install -y wimtools
sudo wimlib-imagex split /mnt/iso/sources/install.wim /media/usb/sources/install.swm 4000
sudo cp -rT --exclude=sources/install.wim /mnt/iso/ /media/usb/
sudo sync




echo "Copying files from ISO to USB..."
sudo cp -rT /mnt/iso/ /media/usb/
sudo sync

echo "Done copying. Please wait about 8 minutes for all operations to complete."





#SECOND TRY


5396* cd ~/Downloads/ventoy-1.1.05
 5397* ls
 5398* sudo ./VentoyWeb.sh
 5399  cp ~/Downloads/Win10_21H1_English_x64.iso /media/ventoy/\n
 5400  lsblk -f\n
 5401  lsblk -o NAME,LABEL,MOUNTPOINT | grep sda1\n
 5402  sudo mkdir -p /media/ventoy\nsudo mount /dev/sda1 /media/ventoy\n
 5403  cp ~/Downloads/Win10_21H1_English_x64.iso /media/ventoy/\n
 5404  sudo cp ~/Downloads/Win10_21H1_English_x64.iso /media/ventoy/\n
 5405* timer 8
 5406  sudo umount /media/ventoy\n
