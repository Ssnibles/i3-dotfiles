# Rosé Pine Moon color scheme for fzf
set -x FZF_DEFAULT_OPTS "--color=bg+:#393552,bg:#232136,spinner:#f6c177,hl:#ea9a97 --color=fg:#e0def4,header:#3e8fb0,info:#9ccfd8,pointer:#c4a7e7 --color=marker:#f6c177,fg+:#e0def4,prompt:#9ccfd8,hl+:#ea9a97"

# fzf_open function
function fzf_open
    set selected_file (fzf --preview 'bat --style=numbers --color=always --theme="base16" --line-range :500 {}')
    if test -n "$selected_file"
        commandline -i "$selected_file"
    end
    commandline -f repaint
end

# File search and edit
function fe
    set file (fzf --query="$argv[1]" --select-1 --exit-0 --preview 'bat --style=numbers --color=always --theme="base16" --line-range :500 {}')
    if test -n "$file"
        if type -q nvim
            nvim "$file"
        else
            echo "Error: nvim is not installed. Please install it or modify the fe function to use a different editor."
            return 1
        end
    else
        echo "No file selected."
        return 1
    end
end

# Directory search and cd
function fcd
    set dir (fd --type d | fzf --preview 'tree -C {} | head -200')
    if test -n "$dir"
        cd "$dir"
    end
end

# Search command history
function fh
    history --null | fzf --read0 +s --tac --preview 'echo {} | fish_indent --ansi' | read -l result
    and commandline "$result"
    commandline -f repaint
end

# Kill process
function fkill
    set pid (ps -ef | sed 1d | fzf -m --header='[kill:process]' --preview 'echo {}' --preview-window down:3:wrap | awk '{print $2}')
    if test -n "$pid"
        echo $pid | xargs kill -9
        echo "Process $pid killed"
    end
end

# Git log browser
function fgl
    git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" | \
    fzf --ansi --no-sort --reverse --tiebreak=index \
        --preview 'git show --color=always (echo {} | grep -o "[a-f0-9]\{7\}" | head -1)' \
        --bind "enter:execute:git show --color=always (echo {} | grep -o '[a-f0-9]\{7\}' | head -1) | less -R"
end

# Fuzzy find and copy file content
function fcp
    set file (fzf --preview 'bat --style=numbers --color=always --theme="base16" --line-range :500 {}')
    if test -n "$file"
        cat "$file" | pbcopy
        echo "Content of $file copied to clipboard"
    end
end

# Fuzzy find and open man pages
function fman
    man -k . | fzf --prompt='Man> ' --preview 'echo {} | cut -d" " -f1 | xargs man' | cut -d" " -f1 | xargs man
end

function fuzzy_all_functions
    set -l selected_function (functions | fzf \
        --preview 'functions {} | fish_indent --ansi | bat --style=numbers --color=always --theme="base16" --language fish' \
        --preview-window=right:70%:wrap \
        --header 'Press Enter to insert function name into terminal')

    if test -n "$selected_function"
        commandline -i "$selected_function"
    end
    commandline -f repaint
end

# smart_fzf function
function smart_fzf
    set -l cmd (commandline -o)
    set -l cursor_pos (commandline -C)
    set -l cmd_prefix (commandline -c)

    if contains $cmd[1] kill
        fkill
    else if contains $cmd[1] nvim vim nano code
        fe
    else if contains $cmd[1] ssh scp sftp
        set host (cat ~/.ssh/known_hosts ~/.ssh/config 2>/dev/null | grep -E '^[^ ]+' | cut -d ' ' -f1 | sort -u | fzf)
        if test -n "$host"
            commandline -i "$host"
        end
    else if test "$cmd[1]" = "cd"
        fcd
    else if test "$cmd[1]" = "git"
        if test (count $cmd) -eq 1
            set subcommand (git --list-cmds=main,others,alias,config | fzf)
            if test -n "$subcommand"
                commandline -i "$subcommand "
            end
        else if test "$cmd[2]" = "checkout"
            set branch (git branch | string replace -r '^\*?\s*' '' | fzf)
            if test -n "$branch"
                commandline -i "$branch"
            end
        else
            fgl
        end
    else if test "$cmd[1]" = "man"
        fman
    else
        fzf_open
    end
    commandline -f repaint
end

# Bind the smart_fzf function to Ctrl-F
bind \cf smart_fzf

# Fuzzy search through defined fuzzy functions
function fuzzy
    set fuzzy_functions fzf_open fe fcd fh fkill fgl fcp fman smart_fzf fuzzy_all_functions
    set function_name (string join \n $fuzzy_functions | fzf --preview 'functions {} | fish_indent --ansi' --preview-window=right:70%:wrap)
    if test -n "$function_name"
        echo "Selected function: $function_name"
        echo "Press [v] to view the function, [e] to execute it, or any other key to cancel."
        read -n 1 -P "Your choice: " choice
        switch $choice
            case v V
                functions "$function_name" | fish_indent --ansi | less -R
            case e E
                eval $function_name
            case '*'
                echo "Operation cancelled."
        end
    end
end

# Set up aliases
alias l 'exa -l --icons --git'
alias ll 'exa -la --icons --git'
alias tree 'exa --tree --icons'

# Set Fish colors to match Rosé Pine Moon theme
set -U fish_color_normal e0def4
set -U fish_color_command 3e8fb0
set -U fish_color_keyword eb6f92
set -U fish_color_quote f6c177
set -U fish_color_redirection eb6f92
set -U fish_color_end f6c177
set -U fish_color_error eb6f92
set -U fish_color_param e0def4
set -U fish_color_comment 6e6a86
set -U fish_color_selection --background=393552
set -U fish_color_search_match --background=393552
set -U fish_color_operator eb6f92
set -U fish_color_escape ea9a97
set -U fish_color_autosuggestion 6e6a86
