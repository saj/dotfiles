local less='less -CQin'
local ls='ls -F'
local ls_long="${ls} -hl"
if [ -x ~/bin/mvim ]; then
    local gvisual="~/bin/mvim"
else
    local gvisual="gvim"
fi

# Humanise UNIX timestamps.
epoch() {
    perl -e "print scalar localtime(\"${1}\") . \"\n\";"
}

# List files, recursively, ignoring VCS crap.
f() {
    p="$1"
    if [ -z "$p" ]; then
        p="."
    fi
    find "$p" -mindepth 1 -not \( -path "*.svn*" -or -path "*.git*" \)
}

# A long file listing with paging.
lll() {
    ${=ls_long} ${@} | ${=less}
}

# Truncate files to nothingness.
trunc() {
    for FILE in ${@}; do
        if [ -f "${FILE}" ]; then
            cat /dev/null >"${FILE}"
            echo "${FILE}"
        else
            echo "trunc: ${FILE}: No such file or directory" >/dev/stderr
        fi
    done
}

export BLOCKSIZE=1k
export EDITOR='vim'
export GIT_PAGER='less -r'
export PAGER=${less}
export VISUAL='vim'

alias '..'='cd ..'
alias c='cd'
alias cls='clear'
alias d='dirs'
alias g="${gvisual}"
alias gs='git status'
alias h='fc -fl -20'
alias hist='fc -fl 1'
alias irc='irssi'
alias j='jobs'
alias l="${ls}"
alias le="${less}"
alias less="${less}"
alias ll="${ls_long}"
alias ls='ls -F'
alias mk='mkdir'
alias mutt='mutt -f ~/Maildir'
alias mx='dig +short mx'
alias ns='dig +short ns'
alias p='pwd'
alias re='vim -Rn'
alias rl='host'
alias s='ssh'
alias sco='scp -o StrictHostKeyChecking=no'
alias sd='svn diff'
alias serial='screen /dev/tty.PL2303-* 9600'
alias sho='ssh -o StrictHostKeyChecking=no'
alias sps='svn ps svn:keywords "Id URL"'
alias sup='svn update'
alias top='top -s 5'
alias v='vim'
alias vh='if [ `id -u` -eq 0 ]; then ${=EDITOR} /etc/hosts; else sudo ${EDITOR} /etc/hosts; fi'

# tmux's command-line interface requires too much typing.
alias tat='tmux attach-session -t'
alias tls='tmux list-sessions'
tnew() {
    if [ $# -ge 1 ]; then
        tmux -2 new-session -s "$*"
    else
        tmux -2 new-session
    fi
}

umask 0022

if [ $(hostname -s) = "gonzo" ]; then
    . ~/.zshrc.home
fi

if [ $(basename $SHELL) = "zsh" ]; then
    . ~/.zshrc.looknfeel
fi
