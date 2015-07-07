set nocompatible

exec ':source ' . expand('~/.vimrc.d/flags')

filetype off

" Install plugins
exec ':source ' . expand('~/.vimrc.d/plugin')
exec ':source ' . expand('~/.vimrc.d/vundle')

filetype on
filetype plugin on
filetype plugin indent on

exec ':source ' . expand('~/.vimrc.d/opts')
exec ':source ' . expand('~/.vimrc.d/maps')
exec ':source ' . expand('~/.vimrc.d/terminal')
exec ':source ' . expand('~/.vimrc.d/syntax')
exec ':source ' . expand('~/.vimrc.d/diffmode')

" Plugin settings
exec ':source ' . expand('~/.vimrc.d/plugins/buffet')
exec ':source ' . expand('~/.vimrc.d/plugins/color-base16')
exec ':source ' . expand('~/.vimrc.d/plugins/color-solarized')
exec ':source ' . expand('~/.vimrc.d/plugins/nerdtree')
exec ':source ' . expand('~/.vimrc.d/plugins/rainbow_parentheses')
exec ':source ' . expand('~/.vimrc.d/plugins/syntastic')
exec ':source ' . expand('~/.vimrc.d/plugins/vimclojure')
exec ':source ' . expand('~/.vimrc.d/plugins/youcompleteme')

" Host-local .vimrc
let s:local_vimrc = expand('~/.vimrc.') . substitute(system('hostname -f'), "\n$", "", '')
if filereadable(s:local_vimrc)
  :exec ":source " . s:local_vimrc
endif

exec ':source ' . expand('~/.vimrc.d/viminfo')
