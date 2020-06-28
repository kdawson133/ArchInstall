#!/bin/sh
#
#     __       __                               _____________
#    / /______/ /___ __      ___________  ____ <  /__  /__  /	https://github.com/kdawson133
#   / //_/ __  / __ `/ | /| / / ___/ __ \/ __ \/ / /_ < /_ < 	@kirk133
#  / ,< / /_/ / /_/ /| |/ |/ (__  ) /_/ / / / / /___/ /__/ / 
# /_/|_|\__,_/\__,_/ |__/|__/____/\____/_/ /_/_//____/____/  
#                                                           
# Hello
#
###########################################
# This script installs the arch base only #
###########################################

# Variables
syskeyboard=us
syscountry=Australia
syslocale=en_AU.UTF-8
genlocale="en_AU.UTF-8 UTF-8"
systimezone=Australia/Sydney

bootpart=/dev/sda1
swappart=/dev/sda2
rootpart=/dev/sda3

microcode=		#ucode-amd

hostname=arch

username=ktdawson

# Load the keymap

loadkeys=$syskeyboard

# Enable NTP

timedatectl set-ntp true

# Configure the mirrorlist
echo
echo "== Configuring Mirrorlist =="
echo
pacman -Syyy
pacman -S reflector --noconfirm
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector -c $syscountry -a 6 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syyy
echo
cat /etc/pacman.d/mirrorlist
echo
echo "== Mirrorlist Configured =="
echo
read -p "Press Enter to Continue...."
clear

# Formatting Partitions
echo
echo "== Formatting Partitions =="
echo
mkfs.fat -F32 $bootpart 
mkfs.ext4 $rootpart
mkswap $swappart
fdisk -l
echo
echo "== Partitions Formatted =="
echo
read -p "Press Enter to Continue...."
clear

# Mount Partitions
echo
echo "== Mounting Partitions =="
echo
swapon $swappart
mount $rootpart /mnt
mkdir /mnt/boot
mount $bootpart /mnt/boot
lsblk
echo
echo "== Partitions Mounted =="
echo
read -p "Press Enter to Continue...."
clear

# Install Base
echo
echo "== Installing Base =="
echo
pacstrap /mnt base linux linux-firmware nano $microcode
echo
echo "== Base Installed =="
echo
read -p "Press Enter to Continue...."
clear

# Generate file system table
echo
echo "== Generating Filesystem Table =="
echo
genfstab -U /mnt >> /mnt/etc/fstab
echo
cat /mnt/etc/fstab
echo
echo "== Filesystem Table Generated =="
echo
read -p "Press Enter to Continue...."
clear

# Enter CHROOT Environment

# Set localisation
echo
echo "== Setting Localisation =="
echo
arch-chroot /mnt timedatectl set-timezone $systimezone
arch-chroot /mnt hwclock --systohc --localtime
echo $genlocale >> /mnt/etc/locale.gen
arch-chroot /mnt locale-gen
echo LANG=$syslocale >> /mnt/etc/locale.conf
echo KEYMAP=$syskeyboard >> /mnt/etc/vconsole.conf
cat /mnt/etc/locale.conf
cat /mnt/etc/vconsole.conf
echo
echo "== Localisation Set =="
echo
read -p "Press Enter to Continue...."
clear

# Set Network
echo
echo "== Setting Network =="
echo
echo $hostname > /mnt/etc/hostname
echo "127.0.0.1		localhost" >> /mnt/etc/hosts
echo "::1			localhost" >> /mnt/etc/hosts
echo "127.0.1.1		"$hostname".localdomain	$hostname" >> /mnt/etc/hosts
cat /mnt/etc/hostname
echo
cat /mnt/etc/hosts
echo
echo "== Network Set =="
echo
read -p "Press Enter to Continue...."
clear

# Set Root Password
echo
echo "== Setting Root Password"
arch-chroot /mnt passwd
echo
echo "== Root Password Set =="
echo
read -p "Press Enter to Continue...."
clear

# Install Bootloader
echo
echo "== Installing Bootloader =="
arch-chroot /mnt pacman -S grub efibootmgr efivar networkmanager network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools dosfstools gvfs-smb base-devel linux-headers reflector git sudo bluez bluez-utils bluez-libs bluez-firmware alsa-utils alsa-plugins pulseaudio pulseaudio-alsa pavucontrol pulseaudio-bluetooth cups cups-pdf ghostscript gsfonts ntfs-3g openssh nss-mdns avahi --noconfirm --needed
arch-chroot /mnt grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ARCH
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
echo
echo "== Bootloader Installed =="
echo
read -p "Press Enter to Continue...."
clear

# Enable services
echo
echo "== Enabling Services =="
echo
arch-chroot /mnt systemctl enable NetworkManager
arch-chroot /mnt systemctl enable bluetooth
arch-chroot /mnt systemctl enable org.cups.cupsd
arch-chroot /mnt systemctl enable sshd
arch-chroot /mnt systemctl enable avahi-daemon
echo
echo "== Services Enabled =="
echo
read -p "Press Enter to Continue...."
clear

# Create New User
echo 
echo "== Creating New User - $username =="
echo
arch-chroot /mnt useradd -mG wheel $username
arch-chroot /mnt passwd $username
nano /mnt/etc/sudoers
echo
echo "== New User - $username Created =="
echo
read -p "Press Enter to Continue...."
clear

# Reboot

umount -a
echo
echo "== Reboot the System Now =="
echo
