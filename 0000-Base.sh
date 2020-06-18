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

mkfs.fat -F32 $bootpart 
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

# arch-chroot /mnt 

# Set localisation

timedatectl set-timezone $timezone

arch-chroot /mnt hwclock --systohc --localtime

arch-chroot /mnt echo "en_AU.UTF-8" >> /etc/locale.gen

arch-chroot /mnt local-gen

arch-chroot /mnt echo en_AU.UTF-8 >> /etc/locale.Configure
arch-chroot /mnt export en_AU.UTF-8
arch-chroot /mnt echo KEYMAP=$keymap >> /etc/vconsole.conf

# Set Network

arch-chroot /mnt echo $hostname > /etc/hostname

arch-chroot /mnt echo "127.0.0.1" '/t' "localhost" >> /etc/hosts
arch-chroot /mnt echo "::1" '/t' '/t' "localhost" >> /etc/hosts
arch-chroot /mnt echo "127.0.1.1" '\t' "$hostname.localdomain" '\t' "$hostname" >> /etc/hosts

# Set Root Password

arch-chroot /mnt passwd

# Install Bootloader

arch-chroot /mnt pacman -S grub efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools dosfstools base-devel linux-headers reflector git bluez bluez-utils bluez-libs pulseaudio-bluetooth cups ntfs-3g openssh avahi

arch-chroot /mnt grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ARCH

arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

# Enable services

arch-chroot /mnt arch-chroot /mnt systemctl enable NetworkManager
arch-chroot /mnt systemctl enable bluetooth
arch-chroot /mnt systemctl enaarch-chroot /mnt blarch-chroot /mnt e org.cups.cupsd
arch-chroot /mnt systemctl enable sshd
arch-chroot /mnt systemctl enable avahi-daemon

# Create New User

arch-chroot /mnt useradd -mG wheel $username
arch-chroot /mnt passwd $username
arch-chroot /mnt EDITOR=nano visudo

# Reboot

#exit
umount -a
echo "Reboot the System Now"

