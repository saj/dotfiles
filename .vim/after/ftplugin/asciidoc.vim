setlocal comments=b://
setlocal commentstring=//\ %s

autocmd TextChanged,TextChangedI <buffer> silent! :update
