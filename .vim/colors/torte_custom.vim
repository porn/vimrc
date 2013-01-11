" Vim color file
" Maintainer:	Thorsten Maerz <info@netztorte.de>
" Last Change:	2006 Dec 07
" grey on black
" optimized for TFT panels

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "torte_custom"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight Normal     guifg=Grey80	guibg=Black
highlight Search     guifg=Black	guibg=Red	gui=bold
highlight Visual     guifg=#404040			gui=bold
highlight Cursor     guifg=Black	guibg=Green	gui=bold
highlight Special    guifg=Orange
highlight Comment    guifg=#80a0ff
highlight StatusLine guifg=blue		guibg=white
highlight Statement  guifg=Yellow			gui=NONE
highlight Type						gui=NONE

" Console
highlight Normal     ctermfg=LightGrey	ctermbg=Black
highlight Search     ctermfg=Black	ctermbg=Red	cterm=NONE
highlight Visual					cterm=reverse
highlight Cursor     ctermfg=Black	ctermbg=Green	cterm=bold
highlight Special    ctermfg=Brown
highlight Comment    ctermfg=Blue
highlight StatusLine ctermfg=blue	ctermbg=white
highlight Statement  ctermfg=Yellow			cterm=NONE
highlight Type						cterm=NONE
highlight TabLineFill ctermfg=LightGrey
highlight TabLine     ctermfg=Black       ctermbg=LightGrey
highlight TabLineSel  term=reverse,bold
highlight Title       ctermfg=White

highlight CursorLine   cterm=NONE ctermbg=DarkRed
highlight CursorColumn cterm=NONE ctermbg=LightGrey ctermfg=white
" nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Presah 80 znaku
"highlight OverLength ctermbg=Blue
"match OverLength /\%>80v.\+/

" zvyrazni mezery na zacatku radku
"highlight LeadingSpace ctermbg=Blue
"match LeadingSpace /^\ +/
