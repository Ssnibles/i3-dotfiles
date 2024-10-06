# Source from conf.d before our fish config
source ~/.config/fish/conf.d/done.fish

# Add custom theme
fish_config theme choose "Rosé Pine Moon"

# Run fastfetch as welcome message
function fish_greeting
    pokeget abra --hide-name > ~/.config/pokemon_logo.txt # Output pokeget to file to be displayed as fastfetch logo
    fastfetch --config ~/.config/fastfetch/main.jsonc # Run custom fastfetch config
    cp /dev/null ~/.config/pokemon_logo.txt # Clear the pokemon_logo file
end

# fzf function. Can work with programs like nvim to fuzzy find and append the search to a command
function fzf_open
    set selected_file (fzf)
    if test -n "$selected_file"
        commandline -i "$selected_file"
    end
    commandline -f repaint
end

function fetch
  fish_greeting # Run fish_greeting function when using fetch
end

# function fzf_select
#   commandline -i '**'
#   commandline -f execute
# end

# File search and edit
function fe
    set file (fzf --query="$argv[1]" --select-1 --exit-0)
    if test -n "$file"
        nvim "$file"
    end
end

# Directory search and cd
function fcd
    set dir (fd --type d | fzf +m)
    if test -n "$dir"
        cd "$dir"
    end
end

# Declare fish keybinds here
function fish_user_key_bindings
    bind \ct 'fzf_open'
    # bind -k tab 'fzf_select'
end

# Search command history
function fh
    history | fzf +s --tac | read -l result; and commandline "$result"
end

# Kill process
function fkill
    set pid (ps -ef | sed 1d | fzf -m | awk '{print $2}')
    if test -n "$pid"
        echo $pid | xargs kill -9
    end
end

# Format man pages
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end


## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

## Useful aliases
# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | grep -e '^\.'"                                     # show only dotfiles

# Common use
alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'          # List amount of -git packages
alias update='sudo pacman -Syu'

# Get fastest mirrors
alias mirror="sudo cachyos-rate-mirrors"

# Help people new to Arch
alias apt='man pacman'
alias apt-get='man pacman'
alias please='sudo'
alias tb='nc termbin.com 9999'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# Open file in emacs cli
alias emacs="emacs -nw $argv"

# Usefull scripts
alias clean="~/repos/scripts/clean.sh"
alias re-add="~/repos/scripts/chezmoi_add.sh"
alias re-shell="source ~/.config/fish/config.fish"

# bind \cl 'clear; commandline -f repaint'
# bind \cx 'echo "Hello, Fish!"'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# PATHs
fish_add_path /home/josh/.spicetify
fish_add_path $HOME/.emacs.d/bin/
