" Modeline and Notes {
"	vim: set foldmarker={,} foldmethod=marker:
"
"	Hosted on github: TODO
" }

" TODO unsorted ... {
	runtime! debian.vim

	set modeline
	set runtimepath+=~/.vim/

	" php offline manuals
	set runtimepath+=~/.vim/doc
	autocmd BufNewFile,Bufread *.php,*.php3,*.php4 set keywordprg="help"

	" load .vimrc upon every save
	if has("autocmd")
		autocmd BufWritePost .vimrc source $MYVIMRC
	endif

" }

" Key Mappings {

	" Other {

		" fix for screen / byobu (Del, Home, End)
		imap <ESC>[7~ <Home>

		" jj instead of esc
		inoremap jj <ESC>

		" Center on found pattern
		nnoremap N Nzz
		nnoremap n nzz

		" Wrapped lines goes down/up to next row, rather than next line in file.
		nnoremap j gj
		nnoremap k gk

		" Space to toggle folds
		nnoremap <Space> za
		vnoremap <Space> za

		" Enter to recursive toggle folds
		nnoremap <Return> zA
		vnoremap <Return> zA
		autocmd CmdwinEnter * nunmap <Return>
		autocmd CmdwinLeave * nnoremap <Return> zA

		" move the line with the tag definition at top of window when jumping
		map <C-]> <C-]>zt
		map g<LeftMouse> g<LeftMouse>zt

	" }

	" Leader Mappings {

		" The default leader is '\', but many people prefer ',' as it's in
		" a standard location
		let mapleader = ','

		" code folding
		map <leader>f :set foldmethod=indent<CR><ESC>

		" Tabs listing
		map <leader>t :tabs<CR>

		" clearing highlighted search
		nmap <silent> <leader>/ :nohlsearch<CR>

		" edit .vimrc
		nmap <leader>v :tabedit $MYVIMRC<CR>

	" }

	" <F2> - <Fx> Mappings {

		" map remove trailing spaces, save all and session save here
		" TODO breaks last search pattern
		nmap <F2> :%s/\s\+$//e<CR>:wa<CR>:exe "mks! ".v:this_session<CR>
		imap <F2> <ESC><F2>

		" quit all
		map <F3> :qa<CR>
		map! <F3> <ESC>:wa<CR>

		" map paired tag closing
		inoremap <F4> </><ESC>2F<yef/pF<xF<i

		" toggle taglist (taglist plugin)
		map <F4> :TlistToggle<CR>

		" toggle paste / nopaste
		set pastetoggle=<F5>
		nmap <F5> :set invpaste<bar>set paste?<CR>

		" toggle wrap / nowrap
		map <F6> :set invwrap<bar>set wrap?<CR>

		" php syntax validation
		map <F8> :!php -l %<CR>

		" open quickfix window, set it modifiable and having number
		map <F9> :cw<bar>set invmodifiable<bar>set invnumber<CR>

	" }

	" Windows and Tabs Switching {

		" Easier moving in tabs
		map <S-H> gT
		map <S-L> gt

		" Easier moving in windows
		noremap <C-J> <C-W>j
		noremap <C-K> <C-W>k

		" switching to left/right also re-draws the screen
		noremap <C-H> <C-W>h<C-L>
		noremap <C-L> <C-W>l<C-L>

		" moving (reordering) tabs
		nnoremap <silent> l :execute 'silent! tabmove ' . tabpagenr()<CR>
		nnoremap <silent> h :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
	" }
" }

" General {
	filetype plugin indent on  	" Automatically detect file types.

	set encoding=utf8			" character encoding used inside Vim
	set fileencoding=utf8		" character encoding for the files
	let g:netrw_liststyle=3     " Use tree-mode as default view


	" Vim UI {

		colorscheme torte_custom		" my favorite colorscheme
		autocmd VimResized * wincmd =	" automatically resize win split on window resize

		syntax on 						" syntax highlighting
		set mouse=a						" automatically enable mouse usage
		set history=100  				" Store more history (default is 20)
		set showmatch					" show matching brackets/parenthesis
		set incsearch					" find as you type search
		set hlsearch					" highlight search terms
		set wildmenu					" show list instead of just completing
		set wildmode=list:longest,full	" command <Tab> completion, list matches, then longest common part, then all.
		set scrolloff=3 				" minimum lines to keep above and below cursor
		set colorcolumn=80				" colorize 80th column (requires vim >= 7.3)

		if has('cmdline_info')
			set ruler					" show the ruler
			" set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
			set showcmd					" show partial commands in status line and
										" selected characters/lines in visual mode
		endif

	" }

	" Formatting {
		set shiftwidth=4		" use indents of 4 spaces
		set tabstop=4 			" an indentation every four columns
		set smartindent			" smart autoindenting when starting a new line

	" }

" }

" Plugins {

	" Gundo {
		nnoremap <leader>g :GundoToggle<CR>
	" }

	" VCS commands {
		" by default: <leader>cs
		nmap <leader>vs :VCSStatus<CR>
		" by default: <leader>cn
		nmap <leader>vb :VCSBlame<CR>
		" by default: <leader>cd
		nmap <leader>vd :VCSDiff<CR>
		" by default: <leader>cl
		nmap <leader>vl :VCSLog<CR>
		" by default: <leader>cu
		nmap <leader>vu :VCSUpdate<CR>
		" by default: <leader>cv
		nmap <leader>vv :VCSVimDiff<CR>
	" }

	" php-doc commands {
		nnoremap <C-P> :call PhpDocSingle()<CR>
		vnoremap <C-P> :call PhpDocRange()<CR>
	" }

	" TagList {
		" set the names of flags
		let tlist_php_settings = 'php;c:class;d:constant;f:function'
		" close all folds except for current file
		let Tlist_File_Fold_Auto_Close = 1
		" make tlist pane active when opened
		let Tlist_GainFocus_On_ToggleOpen = 1
		" width of window
		let Tlist_WinWidth = 40
		" close tlist when a selection is made
		let Tlist_Close_On_Select = 1
	" }

" }

" Use local vimrc if available {
	if filereadable(expand("~/.vimrc.local"))
		source ~/.vimrc.local
	endif
" }
