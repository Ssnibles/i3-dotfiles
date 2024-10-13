# function fzf_select
#   commandline -i '**'
#   commandline -f execute
# end

# fzf function. Can work with programs like nvim to fuzzy find and append the search to a command
function fzf_open
    set selected_file (fzf)
    if test -n "$selected_file"
        commandline -i "$selected_file"
    end
    commandline -f repaint
end

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
