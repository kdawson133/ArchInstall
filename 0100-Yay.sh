#!/bin/sh
echo
echo "== Installing Yay =="
echo
cd "${HOME}"
echo "Cloning: YAY"
git clone "https://aur.archlinux.org/yay.git"
cd ${HOME}/yay
makepkg -si
cd ${HOME}
sudo rm -r yay
echo
echo "== Yay Installed =="
echo


