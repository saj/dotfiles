au BufRead,BufNewFile *.pp set ft=puppet
au BufRead,BufNewFile *.pp set noet fo-=t ts=4

" Clean up lines of whitespace (and nothing else).  Removing tailing 
" whitespace is harder:  I use fo+=w in my block comments and inline 
" documentation.
au BufWritePre *.pp exe "g/^\\s\\+$/normal 0D''"
