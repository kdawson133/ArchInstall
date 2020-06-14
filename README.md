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

