starship init fish | source
set PATH /Users/marius.tobiassen/.nvm/versions/node/v18.0.0/bin $PATH

set -x CLICOLOR 1
set -x TERM xterm-256color
set -x NODE_PATH (npm root --quiet -g)
set -x GPG_TTY $(tty)
fish_add_path /usr/local/sbin

alias vim "nvim"
set -x BAT_THEME Dracula

# Yarn aliases
alias upgradestuff "yarn upgrade-interactive"
alias yarnclean "echo '' > yarn.lock"

# Git aliases
alias gs "git status"
alias gp "git add . -p"
alias commit "gitmoji --commit"

corepack enable

# Init zoxide
zoxide init fish | source
