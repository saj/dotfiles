" Bits and bobs yanked from base16-irblack:
"
" base16-vim (https://github.com/chriskempson/base16-vim)
" by Chris Kempson (http://chriskempson.com)
" IR Black scheme by Timothée Poisot (http://timotheepoisot.fr)

" Performance optimisation: upstream irblack is "00"
let s:cterm00 = "none"
let s:cterm03 = "08"
let s:cterm05 = "07"
let s:cterm07 = "15"
let s:cterm08 = "01"
let s:cterm0A = "03"
let s:cterm0B = "02"
let s:cterm0C = "06"
let s:cterm0D = "04"
let s:cterm0E = "05"
if exists("base16colorspace") && base16colorspace == "256"
  let s:cterm01 = "18"
  let s:cterm02 = "19"
  let s:cterm04 = "20"
  let s:cterm06 = "21"
  let s:cterm09 = "16"
  let s:cterm0F = "17"
else
  let s:cterm01 = "10"
  let s:cterm02 = "11"
  let s:cterm04 = "12"
  let s:cterm06 = "13"
  let s:cterm09 = "09"
  let s:cterm0F = "14"
endif

let s:gui00 = "000000"
let s:gui01 = "242422"
let s:gui02 = "484844"
let s:gui03 = "6c6c66"
let s:gui04 = "918f88"
let s:gui05 = "b5b3aa"
let s:gui06 = "d9d7cc"
let s:gui07 = "fdfbee"
let s:gui08 = "ff6c60"
let s:gui09 = "e9c062"
let s:gui0A = "ffffb6"
let s:gui0B = "a8ff60"
let s:gui0C = "c6c5fe"
let s:gui0D = "96cbfe"
let s:gui0E = "ff73fd"
let s:gui0F = "b18a3d"

function! g:Base16hi(group, guifg, guibg, ctermfg, ctermbg, ...)
  let l:attr = get(a:, 1, "")
  let l:guisp = get(a:, 2, "")

  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if l:attr != ""
    exec "hi " . a:group . " gui=" . l:attr . " cterm=" . l:attr
  endif
  if l:guisp != ""
    exec "hi " . a:group . " guisp=#" . l:guisp
  endif
endfunction

fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  call g:Base16hi(a:group, a:guifg, a:guibg, a:ctermfg, a:ctermbg, a:attr, a:guisp)
endfun

set background=dark

highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "desolate"

call <sid>hi("Normal",         s:gui05, s:gui00, s:cterm05, s:cterm00, "", "")

call <sid>hi("Comment",        s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("String",         s:gui09, "", s:cterm09, "", "", "")

" Disable highlighting on things that are ordinarily highlighted:
call <sid>hi("Constant",       s:gui05, s:gui00, s:cterm05, s:cterm00, "none", "")
call <sid>hi("Delimiter",      s:gui05, s:gui00, s:cterm05, s:cterm00, "none", "")
call <sid>hi("Function",       s:gui05, s:gui00, s:cterm05, s:cterm00, "none", "")
call <sid>hi("Identifier",     s:gui05, s:gui00, s:cterm05, s:cterm00, "none", "")
call <sid>hi("PreProc",        s:gui05, s:gui00, s:cterm05, s:cterm00, "none", "")
call <sid>hi("Special",        s:gui05, s:gui00, s:cterm05, s:cterm00, "none", "")
call <sid>hi("Statement",      s:gui05, s:gui00, s:cterm05, s:cterm00, "none", "")
call <sid>hi("Type",           s:gui05, s:gui00, s:cterm05, s:cterm00, "none", "")

" Verbatim burglary from base16-irblack:
call <sid>hi("Bold",           "", "", "", "", "bold", "")
call <sid>hi("ColorColumn",    "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("Conceal",        s:gui0D, s:gui00, s:cterm0D, s:cterm00, "", "")
call <sid>hi("Cursor",         s:gui00, s:gui05, s:cterm00, s:cterm05, "", "")
call <sid>hi("CursorColumn",   "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("CursorLine",     "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("CursorLineNr",   s:gui04, s:gui01, s:cterm04, s:cterm01, "", "")
call <sid>hi("Debug",          s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Directory",      s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Error",          s:gui00, s:gui08, s:cterm00, s:cterm08, "", "")
call <sid>hi("ErrorMsg",       s:gui08, s:gui00, s:cterm08, s:cterm00, "", "")
call <sid>hi("FoldColumn",     s:gui0C, s:gui01, s:cterm0C, s:cterm01, "", "")
call <sid>hi("Folded",         s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("IncSearch",      s:gui01, s:gui09, s:cterm01, s:cterm09, "none", "")
call <sid>hi("Italic",         "", "", "", "", "none", "")
call <sid>hi("LineNr",         s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("Macro",          s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("MatchParen",     "", s:gui03, "", s:cterm03,  "", "")
call <sid>hi("ModeMsg",        s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("MoreMsg",        s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("NonText",        s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("PMenu",          s:gui05, s:gui01, s:cterm05, s:cterm01, "none", "")
call <sid>hi("PMenuSel",       s:gui01, s:gui05, s:cterm01, s:cterm05, "", "")
call <sid>hi("Question",       s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("QuickFixLine",   "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("Search",         s:gui01, s:gui0A, s:cterm01, s:cterm0A,  "", "")
call <sid>hi("SignColumn",     s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("SpecialKey",     s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("StatusLine",     s:gui04, s:gui02, s:cterm04, s:cterm02, "none", "")
call <sid>hi("StatusLineNC",   s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call <sid>hi("Substitute",     s:gui01, s:gui0A, s:cterm01, s:cterm0A, "none", "")
call <sid>hi("TabLine",        s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLineFill",    s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLineSel",     s:gui0B, s:gui01, s:cterm0B, s:cterm01, "none", "")
call <sid>hi("Title",          s:gui0D, "", s:cterm0D, "", "none", "")
call <sid>hi("TooLong",        s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Underlined",     s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("VertSplit",      s:gui02, s:gui02, s:cterm02, s:cterm02, "none", "")
call <sid>hi("Visual",         "", s:gui02, "", s:cterm02, "", "")
call <sid>hi("VisualNOS",      s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("WarningMsg",     s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("WildMenu",       s:gui08, s:gui0A, s:cterm08, "", "", "")

call <sid>hi("DiffAdd",        s:gui0B, s:gui01,  s:cterm0B, s:cterm01, "", "")
call <sid>hi("DiffChange",     s:gui03, s:gui01,  s:cterm03, s:cterm01, "", "")
call <sid>hi("DiffDelete",     s:gui08, s:gui01,  s:cterm08, s:cterm01, "", "")
call <sid>hi("DiffText",       s:gui0D, s:gui01,  s:cterm0D, s:cterm01, "", "")
call <sid>hi("DiffAdded",      s:gui0B, s:gui00,  s:cterm0B, s:cterm00, "", "")
call <sid>hi("DiffFile",       s:gui08, s:gui00,  s:cterm08, s:cterm00, "", "")
call <sid>hi("DiffNewFile",    s:gui0B, s:gui00,  s:cterm0B, s:cterm00, "", "")
call <sid>hi("DiffLine",       s:gui0D, s:gui00,  s:cterm0D, s:cterm00, "", "")
call <sid>hi("DiffRemoved",    s:gui08, s:gui00,  s:cterm08, s:cterm00, "", "")

call <sid>hi("NERDTreeDirSlash",  s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("NERDTreeExecFile",  s:gui05, "", s:cterm05, "", "", "")

call <sid>hi("SpellBad",       "", "", "", "none", "undercurl", s:gui08)
call <sid>hi("SpellLocal",     "", "", "", "none", "undercurl", s:gui0C)
call <sid>hi("SpellCap",       "", "", "", "none", "undercurl", s:gui0D)
call <sid>hi("SpellRare",      "", "", "", "none", "undercurl", s:gui0E)

delf <sid>hi

unlet s:gui00 s:gui01 s:gui02 s:gui03 s:gui04 s:gui05 s:gui06 s:gui07 s:gui08 s:gui09 s:gui0A s:gui0B s:gui0C s:gui0D s:gui0E s:gui0F
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F
