## 🚀 How to setup
### 1. Ensure that chezmoi is installed on your machine, this is the dotfiles manager I use.
#### To install:

#### Alpine:
apk add chezmoi

#### Arch:
sudo pacman -S chezmoi

#### NixOS:
nix-env -i chezmoi

More ways to install, and other info can be found here: 
https://www.chezmoi.io/install/

### 2. Backup your existing dotfiles:
<p>mkdir ~/dotfiles_backup<br>
cp -r ~/.* ~/dotfiles_backup<p>

OR to just backup your .config folder:
cp -r ~/.config/* ~/dotfiles_backup

### 3. Initilize chezmoi with the repo:
<p>chezmoi init https://github.com/Ssnibles/dotfiles.git<br>
This will clone the repo into the chezmoi source directory (usually found at: ~/.local/share/chezmoi)<p>

### 4. Review the changes that chezmoi would make;
chezmoi diff

### 5. Apply the dotfiles:
chezmoi apply -v

### 6. (Optional) If you want to pull and apply updates made in the future: 
chezmoi update -v

### Additional notes:
- The -v flag in the commands above enables verbose output, which can be helpful for seeing what changes are being made.
- You can use chezmoi edit <file> to make changes to your dotfiles through chezmoi.
- If you make changes directly to your dotfiles, use chezmoi re-add to update chezmoi's source state.

