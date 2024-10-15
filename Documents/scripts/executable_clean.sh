#!/bin/bash

echo "Please enter your password to continue"
## Clean pacman cache
echo "Cleaning pacman cache..."
sudo pacman -Sc --noconfirm

# Remove unused packages (orphans)
echo "Removing orphaned packages..."
sudo pacman -Rns $(pacman -Qtdq) --noconfirm

# Clean pacman cache, keeping only the latest version
echo "Cleaning old versions from pacman cache..."
sudo paccache -rk1

## Clean yay cache
echo "Cleaning paru cache cache..."

# Remove uninstalled AUR packages from cache
paru -Sccd --noconfirm

# Clean build files
rm -rf ~/.cache/paru/

echo "Cleaning complete!"
