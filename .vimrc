" This is a comment.  (I always forget how to open them.)

set nocompatible

source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set autoindent
set backspace=indent,eol,start
set ch=2
set copyindent
set expandtab
set foldmethod=indent
set foldnestmax=2
set formatlistpat=^\\s*\\(\\([#A-Za-z]\\\\|[0-9]\\{1,2\\}\\)[\\]:\\.)}\\t]\\\\|-\\)\\s*
set formatoptions=acnoqrw
set hidden
set history=100
set ignorecase
set incsearch
set modeline
set nobackup
set noequalalways
set nohlsearch
set nostartofline
set nowritebackup
set nu
set preserveindent
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
set winaltkeys=no

" With fo+=c, Vim's autoformatting will only consider text that matches 
" the following setting.  Syntax highlighter classifiers are not 
" factored into the algorithm.  Unfortunately, this makes it difficult 
" (impossible?) to autoformat Python docstrings as proper comments.  
" This line was my last attempt.  It has been left here as a reminder.
"set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,f:\\"\\"\\",e:\\"\\"\\"

filetype on
filetype plugin on
filetype plugin indent on

syntax on
set background=dark
colorscheme solarized

if !(has("win32") || has("win64"))
    set directory=/var/tmp
end

if &diff
    " Who uses macros in diff mode, anyway?
    map q :qall!<CR>
    autocmd VimEnter * windo set wrap
else
    "set nowrap
endif

if exists ("c_comment_strings")
    unlet c_comment_strings
endif

if version >= 700
    autocmd InsertLeave * set nocul 
    autocmd InsertEnter * set cul
endif

if has("win32") || has("win64")
    behave xterm
    map <S-Insert> <MiddleMouse>
endif

" This should be default behaviour!
map Y y$

map <F1> :NERDTreeToggle<CR>
map <F5> :set paste!<CR>:echo &paste<CR>

" Toggle spell checking.
if version >= 700
    map <F6> :setlocal spell! spelllang=en_au<CR>
    set spellfile=~/.en.latin1.add
endif

map <F8> :set hlsearch!<CR>:echo &hlsearch<CR>

" Quick word obliteration.
map <BS> bdw

" Kill the current buffer.
if has('gui_running')
    map ∑ :bdel<CR>
else
    map <ESC>w :bdel<CR>
endif

" Delete/yank from marker F to cursor and put in buffer F.  (F because
" that's under my left index finger; don't clobber A, which I use out of
" habit for other stuff.)  `silent' makes this work even when the marker
" is set at a larger line number than what the current cursor is sitting
" on -- Vim automatically flips them around.
nmap df :silent 'f,.d f<CR>
nmap yf :silent 'f,.y f<CR>

" Delete to the end of the sentence.
nmap ds d/[.?!:]<CR>

cmap w!! w !sudo tee % >/dev/null

" Don't force comments to start on column 1.
inoremap # X#

imap \ds <ESC>o -- Saj Goonatilleke <sg@redu.cx>  <C-R>=strftime("%a, %d %b %Y %T %z")<ESC>
imap \sco ---------------------------------- 8< ----------------------------------<ESC>0
imap \scc ---------------------------------- >8 ----------------------------------<ESC>0

" Plug-in settings

let g:NERDTreeQuitOnOpen = 1

let g:syntastic_enable_signs = 1

" vim:et
