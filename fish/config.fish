starship init fish | source
set PATH /Users/marius.tobiassen/.nvm/versions/node/v21.5.0/bin $PATH

set -x CLICOLOR 1
set -x TERM xterm-256color
set -x NODE_PATH (npm root --quiet -g)
set -x GPG_TTY $(tty)
fish_add_path /usr/local/sbin

alias vim "nvim"
alias vi "nvim"
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

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
# THEME PURE #
set fish_function_path /Users/marius.tobiassen/.config/fish/functions/theme-pure/functions/ $fish_function_path
source /Users/marius.tobiassen/.config/fish/functions/theme-pure/conf.d/pure.fish
