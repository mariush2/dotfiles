alias gits="git status"
alias weather="curl wttr.in"
alias localip="ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2"

# To show and hide desktop icons
alias hidedesk="defaults write com.apple.finder CreateDesktop false && killall Finder"
alias showdesk="defaults write com.apple.finder CreateDesktop true && killall Finder"

function lazygit() {
	git add .
	git commit -a -m "$1"
	git push
}

# For nnn to use quitcd
export NNN_TMPFILE="/tmp/nn"

n()
{
        nnn "$@"

        if [ -f $NNN_TMPFILE ]; then
                . $NNN_TMPFILE
                rm $NNN_TMPFILE
        fi
}

if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
 export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

# Setting PATH for Python 3.7
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'
