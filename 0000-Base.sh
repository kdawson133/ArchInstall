#!/bin/sh
# This script installs the arch base only
#########################################
# Variables
keymap=us
country=Australia

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

# Partitioning Disks



