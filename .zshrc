setopt noglobalrcs

. ~"/.zsh/vars"
. ~"/.zsh/looknfeel"
. ~"/.zsh/aliases"
. ~"/.zsh/environment"

. ~"/.zsh/filesystem"
. ~"/.zsh/git"
. ~"/.zsh/svn"
. ~"/.zsh/time"
. ~"/.zsh/tmux"

case "$(uname -s)"; in
    "Darwin")
        . ~"/.zsh/mac"
        ;;
esac

local me="$(hostname -s)"

if [ -d ~"/.zsh/${me}" ]; then
    for hostrc in ~"/.zsh/${me}"/*; do
        . "$hostrc"
    done
elif [ -f ~"/.zsh/${me}" ]; then
    . ~"/.zsh/${me}"
fi

# vim:ft=zsh
