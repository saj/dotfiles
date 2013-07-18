au BufRead,BufNewFile *.py setlocal ft=python

au FileType python setlocal et sts=4

" With fo+=c, Vim's autoformatting will only consider text that matches 
" the following setting.  Syntax highlighter classifiers are not 
" factored into the algorithm.  Unfortunately, this makes it difficult 
" (impossible?) to autoformat Python docstrings as proper comments.  
" This line was my last attempt.  It has been left here as a reminder.
"au FileType python setlocal comments=:#,sf:\"\"\",m4:*,ef:\"\"\"
