#!/bin/sh
#
#     __       __                               _____________
#    / /______/ /___ __      ___________  ____ <  /__  /__  /	https://github.com/kdawson133
#   / //_/ __  / __ `/ | /| / / ___/ __ \/ __ \/ / /_ < /_ < 	@kirk133
#  / ,< / /_/ / /_/ /| |/ |/ (__  ) /_/ / / / / /___/ /__/ / 
# /_/|_|\__,_/\__,_/ |__/|__/____/\____/_/ /_/_//____/____/  
#                                                           
#
#
################################################
# This script only installs the Yay AUR helper #
################################################
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


