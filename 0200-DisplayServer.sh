#!/bin/sh
echo
echo "== Installing Display Server (XOrg) =="
echo

PKGS=(
        'xorg-server'           # XOrg server
        'xorg-apps'             # XOrg apps group
        'xorg-xinit'            # XOrg init
        'xorg-server-devel'		# XOrg delopment libraries
#		'xf86-video-vmware'		# VM video driver
#       'xf86-video-intel'      # Intel 2D/3D video driver
#		'xf86-video-amdgpu'	 	# AMD 2D/3D video driver
		'nvidia'				# Nvidia 2D/3D video driver
		'nvidia-utils'			# Nvidia utilities
		'nvidia-settings'		# Nvidia setting applet
		'opencl-nvidia'		 	# Nvidia OpenCL
        'mesa'                  # Open source version of OpenGL
#       'xf86-input-libinput'   # Trackpad drivers
        'lightdm'               # Display manager for login screen
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

yay -Sy lightdm-slick-greeter lightdm-settings --noconfirm --needed
sudo cp lightdm.conf /etc/lightdm/
sudo cp slick-greeter.conf /etc/lightdm
sudo cp lightdm-slick-greeter.png /usr/share/slick-greeter 
sudo systemctl enable lightdm.service
#sudo systemctl start lightdm.service

echo
echo "== Display Server Installed =="
echo