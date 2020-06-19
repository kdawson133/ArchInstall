#!/bin/sh
# This script installs the arch base only
#########################################
# Variables
keymap=us
country=Australia

bootpart=/dev/sda1
swappart=/dev/sda2
rootpart=/dev/sda3

microcode=		#ucode-amd

timezone=Australia/Sydney

hostname=arch

username=ktdawson

# Load the keymap

loadkeys=$keymap

# Enable NTP

timedatectl set-ntp true

# Configure the mirrorlist
echo
echo "== Configuring Mirrorlist =="
echo
pacman -Syyy
pacman -S reflector --noconfirm
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector -c $country -a 6 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syyy
echo
echo "== Mirrorlist Configured =="

# Formatting Partitions
echo
echo "== Formatting Partitions =="
echo
mkfs.fat -F32 $bootpart 
mkfs.ext4 $rootpart
mkswap $swappart
echo
echo "== Partitions Formatted =="

# Mount Partitions
echo
echo "== Mounting Partitions =="
echo
swapon $swappart
mount $rootpart /mnt
mkdir /mnt/boot
mount $bootpart /mnt/boot
echo
echo "== Partitions Mounted =="

# Install Base
echo
echo "== Installing Base =="
echo
pacstrap /mnt base linux linux-firmware nano $microcode
echo
echo "== Base Installed =="
echo

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

# Enter CHROOT Environment

# Set localisation
echo
echo "== Setting Localisation =="
echo
timedatectl set-timezone $timezone
arch-chroot /mnt hwclock --systohc --localtime
arch-chroot /mnt echo "en_AU.UTF-8" >> /etc/locale.conf
arch-chroot /mnt locale-gen
arch-chroot /mnt echo "LANG=en_AU.UTF-8" >> /etc/locale.conf
#arch-chroot /mnt export "LANG=en_AU.UTF-8"
arch-chroot /mnt echo "KEYMAP=$keymap" >> /etc/vconsole.conf
echo
echo "== Localisation Set =="
echo

# Set Network
echo
echo "== Setting Network =="
echo
arch-chroot /mnt echo $hostname > /etc/hostname
arch-chroot /mnt echo "127.0.0.1" '/t' "localhost" >> /etc/hosts
arch-chroot /mnt echo "::1" '/t' '/t' "localhost" >> /etc/hosts
arch-chroot /mnt echo "127.0.1.1" '\t' "$hostname.localdomain" '\t' "$hostname" >> /etc/hosts
echo
echo "== Network Set =="
echo

# Set Root Password
echo
echo "== Setting Root Password"
arch-chroot /mnt passwd
echo
echo "== Root Password Set =="
echo

# Install Bootloader
echo
echo "== Installing Bootloader =="
arch-chroot /mnt pacman -S grub efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools dosfstools base-devel linux-headers reflector git bluez bluez-utils bluez-libs pulseaudio-bluetooth cups ntfs-3g openssh avahi --noconfirm --needed
arch-chroot /mnt grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ARCH
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
echo
echo "== Bootloader Installed =="
echo

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

# Create New User
echo 
echo "== Creating New User - $username =="
echo
arch-chroot /mnt useradd -mG wheel $username
arch-chroot /mnt passwd $username
echo
echo "== New User - $username Created =="

# Reboot

umount -a
echo
echo "== Reboot the System Now =="
echo
