![preview.png](preview.png "Preview")

# 🎨 Dotfiles

## 📝 To-Do:

- [ ] 👾 Make Config More universal
- [ ] 🌈 Extend theme support for Doom Emacs
- [ ] 🖥️ Add theme for greeter (SDDM & greetd)
- [x] 💻 Add theme for Bash and Zsh

# 🚀 How to Setup

## 1. 🛠️ Ensure that Chezmoi is installed on your machine

Chezmoi is the dotfiles manager used in this project.

### To install:

#### Alpine:

```bash
apk add chezmoi
```

### Arch:

```bash
sudo pacman -S chezmoi
```

#### NixOS:

```bash
nix-env -i chezmoi
```

More ways to install, and other info can be found here:<br>
https://www.chezmoi.io/install/

## 2. 💾 Backup your existing dotfiles:

To backup all dotfiles:

```bash
mkdir ~/dotfiles_backup
cp -r ~/.* ~/dotfiles_backup
```

OR to just backup your .config folder:

```bash
cp -r ~/.config/* ~/dotfiles_backup
```

## 3. 🏁 Initialize Chezmoi with the repo:

```bash
chezmoi init https://github.com/Ssnibles/dotfiles.git
```

This will clone the repo into the Chezmoi source directory (usually found at: ~/.local/share/chezmoi)

## 4. 👀 Review the changes that Chezmoi would make:

```bash
chezmoi diff
```

## 5. ✅ Apply the dotfiles:

```bash
chezmoi apply -v
```

## 6. 🔄 (Optional) Pull and apply future updates:

```bash
chezmoi update -v
```

📌 Additional notes:

- The -v flag in the commands above enables verbose output, which can be helpful for seeing what changes are being made.
- You can use chezmoi edit <file> to make changes to your dotfiles through Chezmoi.
- If you make changes directly to your dotfiles, use chezmoi re-add to update Chezmoi's source state.

Happy dotfile managing! 🎉
