#!/bin/sh
echo
echo "== Installing Software Main Repository =="
echo

PKGS=(

    # SYSTEM --------------------------------------------------------------

    'linux-LTS'             # Stable kernel
    'linux-headers'         # For compiling modules
    'base-devel'            # Required for compilation

    # TERMINAL UTILITIES --------------------------------------------------

    'bash-completion'       # Tab completion for Bash
    'cronie'                # cron jobs
    'curl'                  # Remote content retrieval
    'file-roller'           # Archive utility
    'gtop'                  # System monitoring via terminal
    'gufw'                  # Firewall manager
    'libsecret'             # Storing passwords
    'hardinfo'              # Hardware info app
    'htop'                  # Process viewer
    'neofetch'              # Shows system info when you launch terminal
    'ntp'                   # Network Time Protocol to set time via network.
    'numlockx'              # Turns on numlock in X11
    'openssh'               # SSH connectivity tools
    'os-prober'             # Utility to detect other OSes
    'avahi'                 # Service discovery using mDNS
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
    'mtools'                # MSDOS utilities
    'dosfstools'            # DOS filesystem utilities
    'gparted'               # Disk utility
    'ntfs-3g'               # Open source implementation of NTFS file system
    'parted'                # Disk utility

    # GENERAL UTILITIES ---------------------------------------------------

    'variety'               # Wallpaper changer
    'xfburn'                # CD burning application
    'steam'                 # Valve Game Delivery System

    # DEVELOPMENT ---------------------------------------------------------
    
    'git'                   # Version control system
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

    'virtualbox'
    'virtualbox-host-modules-arch'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "== Main Software Installed =="
echo