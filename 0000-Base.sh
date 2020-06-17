#!/bin/sh
# This script installs the arch base only
#########################################
# Variables
keymap=us
country=Australia

bootpart=/dev/sda1
swappart=/dev/sda2
rootpart=/dev/sda3

# Load the keymap

loadkeys=$keymap

# Enable NTP

timedatectl set-ntp true

# Configure the mirrorlist

pacman -Syyy
pacman -S reflector --noconfirm
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector -c $country -a 6 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syyy

# Formatting Partitions

mkfs.ext4 $rootpart
mkswap $swappart

# Mount Partitions

swapon $swappart
mount $rootpart /mnt
mkdir /mnt/boot
mount $bootpart /mnt/boot

# Install Base





