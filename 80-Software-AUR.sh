#!/bin/sh
echo
echo "== Installing AUR Software =="
echo

cd "${HOME}"

echo "Cloning: YAY"
git clone "https://aur.archlinux.org/yay.git"


PKGS=(

    # SYSTEM UTILITIES ----------------------------------------------------

    'gtkhash'                   # Checksum verifier
    'pamac'                     # Graphical package manager

    # TERMINAL UTILITIES --------------------------------------------------

    'hyper'                     # Terminal emulator built on Electron

    # UTILITIES -----------------------------------------------------------

    'samba'                     # Samba File Sharing
    'gnome-vfs'                 # Gnome File System Access
    'gvfs-smb'                  # More File System Stuff

    # DEVELOPMENT ---------------------------------------------------------
    
    'visual-studio-code-bin'    # Good text editor
    'sublime-text'              # Even Better editor
    'gitahead-bin'              # git client
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
    'alacarte-xfce'
    'mugshot'
    'mint-themes-git'
    'mint-y-icons-git'
    'mint-x-icons-git'
)


cd ${HOME}/yay
makepkg -si

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

echo
echo "Done!"
echo