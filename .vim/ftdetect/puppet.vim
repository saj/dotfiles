au BufRead,BufNewFile *.pp set ft=puppet
au BufRead,BufNewFile *.pp set noet fo-=t ts=4

" Purge trailing whitespace
au BufWritePre *.pp exe "g/^\\s\\+$/normal 0D''"
" But leave trailing whitespace on comments
au BufWritePre *.pp exe "%s/^\\([^#]\\{-}\\)\\s\\+$/\\1/e"
