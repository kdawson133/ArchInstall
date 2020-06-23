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
        'xdg-utils'				# Xdg utilities
        'lightdm'				# Light DM 
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

sudo cp lightdm.conf /etc/lightdm/
sudo cp slick-greeter.conf /etc/lightdm
sudo cp lightdm-slick-greeter.png /usr/share/slick-greeter 

sudo systemctl enable lightdm.service
#sudo systemctl start lightdm.service

echo
echo "== Desktops Installed =="
echo