#!/bin/sh
echo
echo "== Configuring Repository Mirrors =="
echo
# Synchronise pacman repositories
pacman -Syyy
# Install Refector
pacman -S reflector --noconfirm --needed
# backup mirrorlist
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
# run reflector
reflector -c Australia 6 --sort rate --save /etc/pacman.d/mirrorlist
# resynchronise repositories
pacman -Syyy
echo
echo "== Repository Mirrors congigured =="
echo


