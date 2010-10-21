PATH=~/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games

# Fink ports
if [ -d /sw ]; then
    PATH=$PATH:/sw/bin:/sw/sbin
    if [ -d /sw/lib/git-core ]; then
        PATH=$PATH:/sw/lib/git-core
    fi
fi

if [ -d ~/.gem/ruby/1.8/bin ]; then
    PATH=$PATH:~/.gem/ruby/1.8/bin
fi

ENV=$HOME/.kshrc
if [ -e $HOME/.zshrc ]; then
    ENV=$HOME/.zshrc
fi

export ENV HOME PATH TERM

if [ -x /usr/games/fortune ]; then
    /usr/games/fortune
fi

echo

