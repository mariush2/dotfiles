starship init fish | source
source ~/.iterm2_shell_integration.fish
set PATH /Users/mht/.nvm/versions/node/v17.6.0/bin $PATH

set -x CLICOLOR 1
set -x TERM xterm-256color
set -x NODE_PATH (npm root --quiet -g)
fish_add_path /usr/local/sbin
source ~/.local/share/icons-in-terminal/icons.fish
