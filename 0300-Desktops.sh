#!/bin/sh
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