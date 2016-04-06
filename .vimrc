if v:version < 700
  " All bets are off.
  finish
endif

set nocompatible

filetype off

exec ':source ' . expand('~/.vimrc.d/helpers/flags')
exec ':source ' . expand('~/.vimrc.d/helpers/plugins')
exec ':source ' . expand('~/.vimrc.d/helpers/vundle')

exec ':source ' . expand('~/.vimrc.d/vundle')

filetype on
filetype plugin on
filetype plugin indent on

" Sundry user preferences
for s:pref in glob('~/.vimrc.d/prefs/*', 0, 1)
  exec ':source ' . s:pref
endfor

" Plugin settings
for s:plugin in glob('~/.vimrc.d/plugins/*', 0, 1)
  exec ':source ' . s:plugin
endfor

" Host-local .vimrc
let s:local_vimrc = expand('~/.vimrc.') . substitute(system('hostname -f'), "\n$", "", '')
if filereadable(s:local_vimrc)
  :exec ":source " . s:local_vimrc
endif
