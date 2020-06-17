#!/bin/sh
echo
echo "== Installing Network Components =="
echo

PKGS=(
        'wpa_supplicant'            # Key negotiation for WPA wireless networks
        'wireless_tools'			# Wireless tools
        'dialog'                    # Enables shell scripts to trigger dialog boxex
        'networkmanager'            # Network connection manager
        'network-manager-applet'    # System tray icon/utility for network connectivity
        'avahi'                 	# Service discovery using mDNS
        'nss-mdns'					# mDNS host resolution
        'gvfs-smb'                  # More File System Stuff
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "== Network Components Installed =="
echo