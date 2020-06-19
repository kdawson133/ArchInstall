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
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

nano /etc/lightdm/lightdm.conf

systemctl enable lightdm.service
systemctl start lightdm.service

echo
echo "== Desktops Installed =="
echo