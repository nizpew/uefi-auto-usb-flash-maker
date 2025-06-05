
# Description

This bash script prepares a USB flash drive by wiping existing partitions, creating a new FAT32 partition, mounting a Windows ISO file, and copying the ISO contents to the USB. It pauses at the beginning to confirm the USB device path and ensures the user acknowledges before proceeding. This is useful for creating a bootable Windows installation USB.




Change the paths inside the file for your actual paths: ( /*.iso , /dev/sdx)



---

# README

## USB Windows Installer Creator Script

### Overview

This script automates the process of preparing a USB flash drive as a bootable Windows installer. It:

* Verifies the USB device path with the user before proceeding.
* Erases existing filesystem signatures on the USB drive.
* Creates a new partition table and a single FAT32 partition.
* Mounts the Windows ISO file.
* Copies the contents of the ISO to the USB drive.
* Syncs data to ensure all files are written.

### Prerequisites

* Linux environment with `sudo` privileges.
* Installed tools: `wipefs`, `parted`, `mkfs.fat`, `mount`, `cp`.
* Windows ISO file available locally.

### Usage

1. Open the script file and set the correct USB device path by modifying the `USB_DEVICE` variable. For example:

   ```bash
   USB_DEVICE="/dev/sdb"
   ```

2. Set the correct path to your Windows ISO file in the `ISO_PATH` variable. For example:

   ```bash
   ISO_PATH=~/Downloads/Windows10.iso
   ```

3. Run the script with:

   ```bash
   sudo bash create_win_usb.sh
   ```

4. The script will prompt you to confirm the USB device before proceeding. Press Enter to continue.

5. Wait for the script to finish copying the ISO contents to the USB. It may take several minutes.

### Important Notes

* **Double-check the USB device path!** Using the wrong device can cause data loss.
* The script assumes the USB device is not mounted elsewhere.
* The USB drive will be completely erased.
* The ISO will be mounted read-only.

### Troubleshooting

* If you get permission errors, ensure you run the script with `sudo`.
* If mounting the ISO fails, verify the ISO path and file integrity.
* Use `lsblk` to confirm device names and partitions.

---

If you want, I can generate this as a markdown file for you or help you create a more detailed script with error checking!
