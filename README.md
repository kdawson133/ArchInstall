# ArchInstall
Arch Install Guide and Scripts

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

