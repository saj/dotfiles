au BufRead,BufNewFile *.py set ft=python
au BufRead,BufNewFile *.py set et sts=4

" Clean up lines of whitespace (and nothing else).  Removing tailing 
" whitespace is harder:  I use fo+=w in my block comments and inline 
" documentation.
au BufWritePre *.py exe "g/^\\s\\+$/normal 0D''"
