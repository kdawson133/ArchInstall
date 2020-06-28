#!/bin/sh
#
#     __       __                               _____________
#    / /______/ /___ __      ___________  ____ <  /__  /__  /   https://github.com/kdawson133
#   / //_/ __  / __ `/ | /| / / ___/ __ \/ __ \/ / /_ < /_ <    @kirk133
#  / ,< / /_/ / /_/ /| |/ |/ (__  ) /_/ / / / / /___/ /__/ / 
# /_/|_|\__,_/\__,_/ |__/|__/____/\____/_/ /_/_//____/____/  
#                                                           
#
################################################################
# This script install extra software from the AUR repositories #
################################################################
echo
echo "== Installing AUR Software =="
echo

PKGS=(

    # SYSTEM UTILITIES ----------------------------------------------------

#   'pamac'                     # Graphical package manager
    'bluez-firmware'            # Bluetooth chip firmware

    # TERMINAL UTILITIES --------------------------------------------------

    'micro'                     # Replacement for nano

    # UTILITIES -----------------------------------------------------------


    # DEVELOPMENT ---------------------------------------------------------
    
    'typora'                    # Markdown editor

    # MEDIA ---------------------------------------------------------------


    # POST PRODUCTION -----------------------------------------------------


    # COMMUNICATIONS ------------------------------------------------------

    'google-chrome'             # Google Chrome
    'mailspring'                # Email client
    'skypeforlinux-stable-bin'  # Video conferencing
    'zoom'                  # Video conferencing

    # THEMES --------------------------------------------------------------

    'gtk-theme-arc-git'
    'adapta-gtk-theme-git'
    'paper-icon-theme'
    'tango-icon-theme'
    'tango-icon-theme-extras'
    'numix-icon-theme-git'
    'papirus-icon-theme' 
    'sardi-icons'
    'mint-themes'
    'mint-y-icons'
    'mint-x-icons'
    
)

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm --needed $PKG
done
echo
echo "== AUR Software Installed =="
echo