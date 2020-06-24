#!/bin/sh
#
#     __       __                               _____________
#    / /______/ /___ __      ___________  ____ <  /__  /__  /   https://github.com/kdawson133
#   / //_/ __  / __ `/ | /| / / ___/ __ \/ __ \/ / /_ < /_ <    @kirk133
#  / ,< / /_/ / /_/ /| |/ |/ (__  ) /_/ / / / / /___/ /__/ / 
# /_/|_|\__,_/\__,_/ |__/|__/____/\____/_/ /_/_//____/____/  
#                                                           
#
#################################################################
# This script install extra software from the Arch repositories #
#################################################################
echo
echo "== Installing Software Main Repository =="
echo

PKGS=(

    # SYSTEM --------------------------------------------------------------


    # TERMINAL UTILITIES --------------------------------------------------

    'bash-completion'       # Tab completion for Bash
    'cronie'                # cron jobs
    'curl'                  # Remote content retrieval
    'file-roller'           # Archive utility
    'gtop'                  # System monitoring via terminal
    'libsecret'             # Storing passwords
    'hardinfo'              # Hardware info app
    'htop'                  # Process viewer
    'neofetch'              # Shows system info when you launch terminal
    'ntp'                   # Network Time Protocol to set time via network.
    'numlockx'              # Turns on numlock in X11
    'rsync'                 # Remote file sync utility
    'speedtest-cli'         # Internet speed via terminal
    'unrar'                 # RAR compression program
    'unzip'                 # Zip compression program
    'wget'                  # Remote content retrieval
    'terminator'            # Terminal emulator
    'zenity'                # Display graphical dialog boxes via shell scripts
    'zip'                   # Zip compression program
    'zsh'                   # ZSH shell
    'zsh-completions'       # Tab completion for ZSH

    # FONTS ---------------------------------------------------------------

    'terminus-font'         # Font package with some bigger fonts for login terminal

    # DISK UTILITIES ------------------------------------------------------

    'autofs'                # Auto-mounter
    'exfat-utils'           # Mount exFat drives
    'gparted'               # Disk utility
    'parted'                # Disk utility

    # GENERAL UTILITIES ---------------------------------------------------

    'variety'               # Wallpaper changer
    'xfburn'                # CD burning application
    #'steam'                 # Valve Game Delivery System

    # DEVELOPMENT ---------------------------------------------------------
    
    'meld'                  # File/directory comparison
    'nodejs'                # Javascript runtime environment
    'npm'                   # Node package manager
    'python'                # Scripting language
    'ruby'                  # Useful programming language
    'yarn'                  # Dependency management (Hyper needs this)

    # WEB TOOLS -----------------------------------------------------------

    'firefox'               # Web browser
    'firefox-i18n-en-gb'    # British english language pack
    
    # COMMUNICATIONS ------------------------------------------------------

    'signal-desktop'        # Secure messaging

    
    # MEDIA ---------------------------------------------------------------

    'obs-studio'            # Record your screen
    'vlc'                   # Video player
    'audacious'             # Music player
    
    # GRAPHICS AND DESIGN -------------------------------------------------

    'gcolor2'               # Colorpicker
    'gimp'                  # GNU Image Manipulation Program
    'inkscape'              # Prfessional Vector Graphics
    'shotwell'              # Photo Organiser
    'darktable'             # Photo Editor

    # PRODUCTIVITY --------------------------------------------------------

    'xpdf'                  # PDF viewer

    # VIRTUALIZATION ------------------------------------------------------

#    'virtualbox'
#    'virtualbox-host-modules-arch'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "== Main Software Installed =="
echo