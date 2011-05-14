setopt noglobalrcs

. ~/.zsh/vars
. ~/.zsh/functions
. ~/.zsh/looknfeel
. ~/.zsh/aliases
. ~/.zsh/environment

if [ -f ~/.zsh/$(hostname -s) ]; then
    . ~/.zsh/$(hostname -s)
fi

# vim:ft=zsh
