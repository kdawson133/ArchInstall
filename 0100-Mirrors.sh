#!/bin/sh
echo
echo "== Configuring Repository Mirrors =="
echo
# Synchronise pacman repositories
sudo pacman -Syyy
# Install Refector
sudo pacman -S reflector --noconfirm --needed
# backup mirrorlist
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
# run reflector
sudo reflector -c Australia 6 --sort rate --save /etc/pacman.d/mirrorlist
# resynchronise repositories
sudo pacman -Syyy
echo
echo "== Repository Mirrors congigured =="
echo


