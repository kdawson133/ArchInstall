# ArchInstall
Arch Install Guide and Scripts (Multiboot)

## 1. Download 
Download and burn the Archlinux ISO to removable media.

## 2. Boot 
Boot the target system using the removable media prepared in step one.

## 3. Set Keymap

To list key maps use the following command:

```bash
localctl list-keymaps | grep US
```

To load the key map enter the following:

```bash
loadkeys us
```

## 4. Establish Internet Connectivity

Check interface status by:

```bash
ip a
```

Confirm that your interface has an IP address and it is UP.

If you have wifi, connect using:

```bash
wifi-menu
```

Then select your network and enter the password.

Then confirm your connection with a ping:

```bash
ping -c 3 google.com
```


## 5. Enable NTP

Enable NTP by:

```bash
timedatectl set-ntp true
```

## 6. Configure the Mirrorlist

Start by synchronising pacman by:

```bash
pacman -Syyy
```

The install `reflector` by:

```bash
pacman -S reflector
```

Backup the `mirrorlist` file with:
```bash
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.Backup
```

Then run `reflector` to find our best mirrors with:

```bash
reflector -c Australia -a 6 --sort rate --save /etc/pacman.d/mirrorlist
```

Then synchronise our repositories again:

```bash
pacman -Syyy
```

## 7. Patitioning Disks

List your block devices by:

```bash
lsblk
```

Then examine your windows disk for EFI partition by the following command:

```bash
cfdisk /dev/sda
```

Take note of the EFI partition e.g. `/dev/sda2` and our windows partiton /dev/sda4

Partition our new linux disk e.g. /dev/sdb

```bash
cfdisk /dev/sdb
```

Create a new partition using the complete disk.

Once this is complete run `lsblk` and we will see our new partition in the listing e.g. `sdb1`.

Now we format the partition by:

```bash
mkfs.ext4 /dev/sdb1
```

## 8. Mount the Partitions

mount our freshly created install partition by:

```bash
mount /dev/sdb1 /mnt
```

Now we mount our EFI partiton by:

```bash
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot
```

Now we mount  our windows partition by:

```bash
mkdir /mnt/windows
mount /dev/sda4
```

Now run `lsblk` to confirm our mount points.

## 9. Install the Base Packages

Run the pacstrap script like so:

```bash
pacstrap /mnt base linux linux-firmware nano git amd-ucode
```

## 10. Create the File System Table

Generat the `fstab` file like so:

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

Check our output with:

```bash
cat /mnt/etc/fstab
```

## 11. Enter the New System

Enter the CHROOT environment by:

```bash
arch-chroot /mnt
```

***The login prompt will have changed***.

## 11. Create and Mount a Swapfile

Create the swapfile by:

```bash
fallocate -l 8GB /swapfile
```

Change the permissions of the swapfile by:

```bash
chmod 600 /swapfile
```

Format and activate the swapfile by:

```bash
mkswap /swapfile
swapon /swapfile
```

Add the swapfile to `fstab` by:

```bash
nano /etc/fstab
```

Add the followin to the end of the file:

```bash
/swapfile none swap defaults 0 0
```

## 12. Set Localisation Details

Set the timezone by:

```bash
timedatectl set-timezone Australia/Sydney
```

Sychronise hardware clock to system clock with:

```bash
hwclock --systohc --localtime
```

Edit the `locale.gen` file with:

```bash
nano /etc/locale.gen
```

Here we uncomment our locale e.g. `en_AU-UTF-8` and save and exit.

Then enter:

```bash
locale-gen
echo "LANG=en_AU.UTF-8" >> /etc/locale.conf
echo "KEYMAP=us" >> /etc/vconsole.conf
```

## 13. Set Network Details

Set `hostname` by:

```bash
echo hostname > /etc/hostname
```

Now add the following to the `/etc/hosts` file:

```bash
127.0.0.1    localhost
::1          localhost
127.0.1.1    hostname.localdomain    hostname
```

## 14. Set Root Password

Set root password by entering:

```bash
passwd
```

## 15. Install the Bootloader

Install the required packages with:

```bash
pacman -S grub efibootmgr
```

Now we actually install the bootloader by:

```bash
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
```

Configure the grub with:

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

## 16. Create a New User

Creat a new user with this:

```bash
useradd -mG wheel username
passwd username
EDITOR=nano visudo
```

Then uncomment out the wheel line `# %wheel ALL=(ALL) ALL`, save and exit. (`nano /etc/sudoers` will do the same thing)

## 17. Reboot

Time to reboot, exit the chroot, unmount partitions and reboot by:

```bash
exit
umount -a
reboot
```

## 18. Login and Recheck the Internet Connection

Enter the following:

```bash
ip a
```

For a wifi connection:

```bash
nmtui
```

## 19. Run Scripts
run the following command:

```bash
git clone https://github.com/kdawson133/ArchInstall.git
cd ArchInstall
chmod +x *.sh
```

then run the all the scrips in numerical order, for example:
```bash
sudo sh 00-Mirrors.sh 
```
 then reboot.

** You are now done!! **

