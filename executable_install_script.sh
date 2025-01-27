#!/bin/bash

# Colors for output
declare -A colors=(
  [RED]='\033[0;31m'
  [GREEN]='\033[0;32m'
  [YELLOW]='\033[1;33m'
  [BLUE]='\033[0;34m'
  [NC]='\033[0m' # No Color
)

# Function to print colored output
print_color() {
  printf "${colors[$2]:-${colors[NC]}}%s${colors[NC]}\n" "$1"
}

print_color "This is a script to install packages used in my dotfiles. It will install critical components first, and then you will be able to pick and choose from additional, non-critical programs." "BLUE"

# Check if paru is installed
if ! command -v paru &>/dev/null; then
  print_color "Installing paru..." "YELLOW"
  sudo pacman -S --needed base-devel
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si --noconfirm
  cd ..
  rm -rf paru
else
  print_color "paru is already installed." "GREEN"
fi

print_color "Installing critical components..." "YELLOW"
paru -S --needed --noconfirm ttf-font-awesome noto-fonts noto-fonts-emoji ttf-jetbrains-mono-nerd bluez bluez-utils blueman curl starship picom polybar fastfetch brightnessctl xclip luarocks neovim npm fish

print_color "Finished installing critical components.
" "GREEN"
print_color "The script will now initialize system services of newly installed packages." "BLUE"

if ! lsmod | grep -q btusb; then
  print_color "Loading btusb module..." "YELLOW"
  sudo modprobe btusb
fi

print_color "Starting and enabling bluetooth service...
" "YELLOW"
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

declare -A programs=(
  ["zed"]="A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter"
  ["neofetch"]="A command-line system information tool"
  ["htop"]="An interactive process viewer"
  ["vesktop"]="A discord client with deep customisation through plugins, and offering better performance on linux"
  # Add more programs here
)

for program in "${!programs[@]}"; do
  description="${programs[$program]}"
  print_color "Would you like to install $program? $description (y/n): " "YELLOW"
  read -r response
  case $response in
  [Yy]*)
    print_color "Installing $program..." "BLUE"
    if paru -S --needed --noconfirm "$program"; then
      print_color "$program installed successfully." "GREEN"
    else
      print_color "Failed to install $program." "RED"
    fi
    ;;
  [Nn]*)
    print_color "Skipping $program installation." "RED"
    ;;
  *)
    print_color "Invalid response. Skipping $program installation." "RED"
    ;;
  esac
  echo
done

print_color "Would you like to install spicetify? A tool which adds plugin support for spotfy (requires spotify to be installed)" "YELLOW"

read -r response
case $response in
[Yy]*)
  print_color "Installing spotify and spicetify..." "BLUE"
  paru -S spotify
  curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
  sudo chmod a+wr /opt/spotify
  sudo chmod a+wr /opt/spotify/Apps -R
  spicetify backup apply
  ;;
[Nn]*)
  print_color "Skipping spietify installation." "RED"
  ;;
*)
  print_color "Invalid response. Skipping spicetify installation." "RED"
  ;;
esac

# Setup brightnessctl
# Function to check if the script is run as root
check_root() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run this script as root or with sudo."
        exit 1
    fi
}

# Function to get the current user (even when run with sudo)
get_current_user() {
    if [ "$SUDO_USER" ]; then
        echo "$SUDO_USER"
    else
        echo "$USER"
    fi
}

# Main function
setup_brightness_control() {
    check_root

    # Get the current user
    CURRENT_USER=$(get_current_user)

    # Find the backlight device
    BACKLIGHT_DEVICE=$(ls /sys/class/backlight/ | head -n 1)
    if [ -z "$BACKLIGHT_DEVICE" ]; then
        echo "No backlight device found."
        exit 1
    fi

    echo "Found backlight device: $BACKLIGHT_DEVICE"

    # Create udev rule
    cat > /etc/udev/rules.d/90-backlight.rules << EOF
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video /sys/class/backlight/$BACKLIGHT_DEVICE/brightness"
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chmod g+w /sys/class/backlight/$BACKLIGHT_DEVICE/brightness"
EOF

    echo "Created udev rule in /etc/udev/rules.d/90-backlight.rules"

    # Add user to video group
    usermod -aG video "$CURRENT_USER"
    echo "Added user $CURRENT_USER to video group"

    # Reload udev rules
    udevadm control --reload-rules && udevadm trigger
    echo "Reloaded udev rules"

    # Print Polybar configuration
    echo "Add the following to your Polybar configuration:"
echo "[module/backlight]
type = internal/backlight

; Use the following command to list available cards:
; $ ls -1 /sys/class/backlight/
card = amdgpu_bl0

use-actual-brightness = true
enable-scroll = true

format = <ramp> <label>
label = %percentage%%

ramp-0 = 󰃞
ramp-1 = 󰃟
ramp-2 = 󰃠
ramp-foreground = ${colors.primary}

scroll-up = sudo brightnessctl set +5%
scroll-down = sudo brightnessctl set 5%-"

    echo "Setup complete. Please reboot your system or log out and log back in for changes to take effect."
}

# Run the main function
setup_brightness_control

print_color "Installation process completed." "GREEN"

