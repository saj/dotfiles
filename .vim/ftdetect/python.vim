au BufRead,BufNewFile *.py set ft=python
au BufRead,BufNewFile *.py set et sts=4

" Purge trailing whitespace
au BufWritePre *.py exe "g/^\\s\\+$/normal 0D''"
" But leave trailing whitespace on comments
au BufWritePre *.py exe "%s/^\\([^#]\\{-}\\)\\s\\+$/\\1/e"
