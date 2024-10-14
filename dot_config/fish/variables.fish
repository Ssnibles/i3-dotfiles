set -gx EDITOR "nvim"

# Format man pages
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c "col -bx | bat -l man -p""

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

# nnn
set -gx NNN_PLUG "f:finder;o:fzopen;p:preview-tui"
set -gx NNN_COLORS "2136"
set -gx NNN_BMS "d:~/Documents;u:/home/user/Uploads;D:~/Downloads/"
set -gx NNN_FIFO "/tmp/nnn.fifo"
set -gx NNN_OPENER "nvim"

set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
