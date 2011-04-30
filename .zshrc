setopt noglobalrcs

local less='less -CQin'
local ls='ls -F'
local ls_long="${ls} -hl"
if [ -x ~/bin/mvim ]; then
    local gvisual="~/bin/mvim"
else
    local gvisual="gvim"
fi

# Colourise ls output.  Not all platforms do this the same way.
case `uname -s` in
    Darwin)
        export CLICOLOR=true
        ;;
    Linux)
        ls="${ls} --color=auto"
        ;;
esac

# Colourise grep output.
if grep --version | head -1 | grep -q GNU ; then
    grep="grep --color=auto"
fi

# Humanise UNIX timestamps.
epoch() {
    perl -e "print scalar localtime(\"${1}\") . \"\n\";"
}

# List files, recursively, ignoring Mac, Vim, and VCS crap.
f() {
    p="$1"
    if [ -z "$p" ]; then
        p="."
    fi
    find "$p" -mindepth 1 -not \( \
      -name '.*.swp' -or \
      -name '.DS_Store' -or \
      -path "*.svn*" -or \
      -path "*.git*" \)
}

# A long file listing with paging.
lll() {
    ${=ls_long} ${@} | ${=less}
}

# Pull everything under args to the PWD
surface() {
    for ARG in ${@}; do
        if [ -d "$ARG" ]; then
            find "$ARG" -mindepth 1 -maxdepth 1 -exec mv "{}" . \;
            rmdir "$ARG"
        fi
    done
}

# Truncate files to nothingness.
trunc() {
    for ARG in ${@}; do
        if [ -f "$ARG" ]; then
            cat /dev/null >"$ARG"
            echo "$ARG"
        else
            echo "trunc: ${ARG}: No such file or directory" >/dev/stderr
        fi
    done
}

export ACK_PAGER='less -r'
export BLOCKSIZE=1k
export EDITOR='vim'
export GIT_PAGER='less -r'
export PAGER=${less}
export VISUAL='vim'

alias '..'='cd ..'
alias c='cd'
alias cls='clear'
alias d='dirs'
alias flushdns='dscacheutil -flushcache'
alias g="${gvisual}"
alias gd='git diff'
alias grep="${grep}"
alias gs='git status'
alias h='fc -fl -20'
alias hist='fc -fl 1'
alias irc='irssi'
alias j='jobs'
alias l="${ls}"
alias le="${less}"
alias less="${less}"
alias ll="${ls_long}"
alias ls="${ls}"
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
alias v='vim'
alias vh='if [ `id -u` -eq 0 ]; then ${=EDITOR} /etc/hosts; else sudo ${EDITOR} /etc/hosts; fi'

# Debian packages ack as ack-grep.  A Kanji converter won out.
if which ack-grep >/dev/null 2>&1; then
    alias ack="`which ack-grep`"
fi

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

case $(hostname -s) in
    gonzo)
        . ~/.zshrc.home
        ;;
    reno)
        . ~/.zshrc.loot
        ;;
esac

if [ $(basename $SHELL) = "zsh" ]; then
    . ~/.zshrc.looknfeel
fi
