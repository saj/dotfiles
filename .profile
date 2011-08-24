PATH=~/bin:/bin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/games

ENV=$HOME/.kshrc
if [ -e $HOME/.zshrc ]; then
    ENV=$HOME/.zshrc
fi

export ENV HOME PATH TERM

if [ -x /usr/games/fortune ]; then
    /usr/games/fortune
fi

echo

