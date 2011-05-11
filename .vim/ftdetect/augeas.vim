au BufRead,BufNewFile *.aug set ft=augeas
au BufRead,BufNewFile *.aug set et sts=2

" Purge trailing whitespace
au BufWritePre *.aug exe "g/^\\s\\+$/normal 0D''"
