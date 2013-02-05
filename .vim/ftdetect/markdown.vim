au BufRead,BufNewFile *.markdown setlocal ft=markdown
au BufRead,BufNewFile *.md       setlocal ft=markdown
au BufRead,BufNewFile *.mdown    setlocal ft=markdown
au BufRead,BufNewFile *.mkd      setlocal ft=markdown
au BufRead,BufNewFile *.mkdn     setlocal ft=markdown

au FileType markdown setlocal fo+=t spell
