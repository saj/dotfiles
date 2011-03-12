" This is a comment.  (I always forget how to open them.)

set nocompatible

if &diff
    " Who uses macros in diff mode, anyway?
    map q :qall!<CR>
    autocmd VimEnter * windo set wrap
else
    "set nowrap
endif

if ! has ("gui_running")
    " I shouldn't have to force this...
    set t_Co=256
endif
colorscheme kellys
syntax on

if exists ("c_comment_strings")
    unlet c_comment_strings
endif

if exists ("php_htmlInStrings")
    php_htmlInStrings = 0
endif

if version >= 700
    autocmd InsertLeave * set nocul 
    autocmd InsertEnter * set cul
endif

if has ("win32")
    behave xterm
    map <S-Insert> <MiddleMouse>
endif

imap \sign <ESC>o<C-R>=strftime("%a %b %d %Y %H:%M:%S")<CR> sgoonatilleke<ESC>
imap \sco ---------------------------------- 8< ----------------------------------<ESC>0
imap \scc ---------------------------------- >8 ----------------------------------<ESC>0

" Quick word obliteration.
map <BS> bdw

" Delete/yank from marker F to cursor and put in buffer F.  (F because
" that's under my left index finger; don't clobber A, which I use out of
" habit for other stuff.)  `silent' makes this work even when the marker
" is set at a larger line number than what the current cursor is sitting
" on -- Vim automatically flips them around.
nmap df :silent 'f,.d f<CR>
nmap yf :silent 'f,.y f<CR>

" Delete to the end of the sentence.
nmap ds d/[.?!:]<CR>

" Toggle spell checking.
if version >= 700
    map <F3> :setlocal spell! spelllang=en_au<CR>
    set spellfile=~/.en.latin1.add
endif

map <F4><F4> :set shiftwidth?<CR>
map <F4>2    :set shiftwidth=2<CR>:set softtabstop=2<CR>
map <F4>4    :set shiftwidth=4<CR>:set softtabstop=4<CR>
map <F4>8    :set shiftwidth=8<CR>:set softtabstop=0<CR>
map <F5>     :set paste!<CR>:echo &paste<CR>

" This should be default behaviour!
map Y y$

set autoindent
set backspace=indent,eol,start
"set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,f:\\"\\"\\",e:\\"\\"\\"
set ch=2
set expandtab
"set foldmethod=indent
"set formatlistpat=^\\<\\(\\d\\+[\\]:.)}\\t\ ]\\\|[o-]\\)\\>
set formatoptions=acnoqrw
set hidden
set history=100
set ignorecase
set incsearch
set modeline
set nobackup
set nohlsearch
set nostartofline
set nowritebackup
set nu
set ruler
set scrolloff=2
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smartindent
set softtabstop=4
set tabstop=8
set textwidth=72

" Plug-in settings

map <F2> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1

" vim:et
