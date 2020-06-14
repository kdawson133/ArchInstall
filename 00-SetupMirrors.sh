#!/bin/sh
# Synchronise pacman repositories
pacman -Syyy
# Install Refector
pacman -S reflector
# backup mirrorlist
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
# run reflector
reflector -c Australia 6 --sort rate --save /etc/pacman.d/mirrorlist
# resynchronise repositories
