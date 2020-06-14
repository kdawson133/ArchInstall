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

Now run `lsblk` to conform our mount points.

## 