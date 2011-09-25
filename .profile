PATH=~/bin:~/local/bin
PATH="$PATH:/bin:/sbin"
PATH="$PATH:/usr/local/bin:/usr/local/sbin"
PATH="$PATH:/usr/bin:/usr/sbin"
PATH="$PATH:/usr/X11R6/bin:/usr/games"

ENV=$HOME/.kshrc
if [ -e $HOME/.zshrc ]; then
    ENV=$HOME/.zshrc
fi

export ENV HOME PATH TERM

which fortune >/dev/null 2>&1 && fortune

echo

