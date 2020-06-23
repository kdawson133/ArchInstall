#!/bin/sh
echo
echo "== Installing AUR Software =="
echo

PKGS=(

    # SYSTEM UTILITIES ----------------------------------------------------

#    'pamac'                     # Graphical package manager

    # TERMINAL UTILITIES --------------------------------------------------

    'micro'                     # Replacement for nano

    # UTILITIES -----------------------------------------------------------


    # DEVELOPMENT ---------------------------------------------------------
    
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