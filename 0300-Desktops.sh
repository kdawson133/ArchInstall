#!/bin/sh
#
#     __       __                               _____________
#    / /______/ /___ __      ___________  ____ <  /__  /__  /   https://github.com/kdawson133
#   / //_/ __  / __ `/ | /| / / ___/ __ \/ __ \/ / /_ < /_ <    @kirk133
#  / ,< / /_/ / /_/ /| |/ |/ (__  ) /_/ / / / / /___/ /__/ / 
# /_/|_|\__,_/\__,_/ |__/|__/____/\____/_/ /_/_//____/____/  
#                                                           
#
####################################################################
# This script installs the Gnome and Cinnamon desktop environments #
####################################################################
echo
echo "== Installing Desktops =="
echo

PKGS=(
        'gnome'                 # Gnome
        'gnome-extra'			# Gnome extras
        'cinnamon'				# Cinnamon
        'nemo-fileroller'		# Cinnamon plugin
        'nemo-share'			# Cinnamon plugin
        'blueberry'				# Cinnamon bluetooth
        'volumeicon'			# System tray volume control
        'system-config-printer'	# GUI for CUPS
        'xdg-utils'				# Xdg utilities 
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done




echo
echo "== Desktops Installed =="
echo