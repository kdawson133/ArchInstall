#!/bin/sh
echo
echo "== Installing Desktops =="
echo

PKGS=(
        'gnome'                 # Gnome
        'gnome-extra'			# Gnome extras
        'cinnamon'				# Cinnamon
        'nemo-fileroller'		# cinnamon plugin
        'xdg-utils'				# Xdg utilities
        'lightdm'				# Light DM 
#        'gdm'					# Gnome DM
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "== Desktops Installed =="
echo