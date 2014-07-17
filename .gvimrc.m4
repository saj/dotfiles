divert(-1)

define(`os_name', patsubst(esyscmd(`uname -s'), `
'))

divert`'dnl
set columns=80
set guicursor=a:blinkon0
ifelse(os_name, `Darwin', `dnl
set guifont=Menlo:h12.00`'dnl
')dnl
ifelse(os_name, `Linux', `dnl
')
set guioptions=egmrt
set lines=40
