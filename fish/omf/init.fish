alias gits="git status"
alias weather="curl wttr.in"
alias l="ls -l"

function lazygit
  git add .
  git commit -a -m "$1"
  git push
end

function fcd --description "Fuzzy change directory"
    if set -q argv[1]
        set searchdir $argv[1]
    else
        set searchdir $HOME
    end

    # https://github.com/fish-shell/fish-shell/issues/1362
    set -l tmpfile (mktemp)
    find $searchdir \( ! -regex '.*/\..*' \) ! -name __pycache__ -type d | fzf > $tmpfile
    set -l destdir (cat $tmpfile)
    rm -f $tmpfile

    if test -z "$destdir"
        return 1
    end

    cd $destdir
end

# Print fish, this is very important!
# curl https://gist.githubusercontent.com/pathawks/66b8ce97a5b2f26d5356ac6b52bca8c1/raw/73b9493c042e94f196bf543ae0b3a933a973b1c3/fish.txt
