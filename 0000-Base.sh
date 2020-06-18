#!/bin/sh
# This script installs the arch base only
#########################################
# Variables
keymap=us
country=Australia

bootpart=/dev/sda1
swappart=/dev/sda2
rootpart=/dev/sda3

microcode=ucode-amd

timezone=Australia/Sydney

hostname=arch

username=ktdawson

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

pacstrap /mnt base linux linux-firmware nano $microcode

# Generate file system table

genfstab -U /mnt >> /mnt/etc/fstab

cat /mnt/etc/fstab

# Enter CHROOT Environment

arch-chroot /mnt 

# Set localisation

timedatectl set-timezone $timezone

hwclock --systohc --localtime

echo "en_AU.UTF-8" >> /etc/locale.gen

local-gen

echo en_AU.UTF-8 >> /etc/locale.Configure
export en_AU.UTF-8
echo KEYMAP=$keymap >> /etc/vconsole.conf

# Set Network

echo $hostname > /etc/hostname

echo "127.0.0.1" '/t' "localhost" >> /etc/hosts
echo "::1" '/t' '/t' "localhost" >> /etc/hosts
echo "127.0.1.1" '\t' "$hostname.localdomain" '\t' "$hostname" >> /etc/hosts

# Set Root Password

passwd

# Install Bootloader

pacman -S grub efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools dosfstools base-devel linux-headers reflector git bluez bluez-utils bluez-libs pulseaudio-bluetooth cups ntfs-3g openssh avahi

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ARCH

grub-mkconfig -o /boot/grub/grub.cfg

# Enable services

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable org.cups.cupsd
systemctl enable sshd
systemctl enable avahi-daemon

# Create New User

useradd -mG wheel $username
passwd $username
EDITOR=nano visudo

# Reboot
exit
umount -a

echo "Reboot th System Now"

