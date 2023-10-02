" Modeline and Notes {{{
"	vim: set foldmethod=marker foldlevel=99:
"
"	Hosted on github: https://github.com/porn/vimrc
" }}}

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vundle ... {{{
	set nocompatible              " be iMproved, required
	filetype off                  " required

	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'

	" The following are examples of different formats supported.
	" Keep Plugin commands between vundle#begin/end.
	" plugin on GitHub repo
	Plugin 'tpope/vim-eunuch.git'
	Plugin 'tpope/vim-fugitive.git'
	Plugin 'tpope/vim-repeat.git'
	Plugin 'tpope/vim-surround.git'
	Plugin 'tpope/vim-unimpaired.git'
	Plugin 'tpope/vim-speeddating.git'
	Plugin 'nelstrom/vim-visual-star-search.git'
	Plugin 'majutsushi/tagbar'
	Plugin 'pearofducks/ansible-vim'
	" Plugin 'vim-scripts/vcscommand.vim'
	Plugin 'sumpygump/php-documentor-vim'
	Plugin 'scrooloose/nerdtree'
	Plugin 'tpope/vim-commentary'
	Plugin 'davidhalter/jedi-vim'
	Plugin 'scrooloose/syntastic'
	Plugin 'raimon49/requirements.txt.vim'
	" https://github.com/bogado/file-line
	Plugin 'bogado/file-line'

	" " plugin from http://vim-scripts.org/vim/scripts.html
	" Plugin 'L9'
	" " Git plugin not hosted on GitHub
	" Plugin 'git://git.wincent.com/command-t.git'
	" " git repos on your local machine (i.e. when working on your own plugin)
	" Plugin 'file:///home/gmarik/path/to/plugin'
	" " The sparkup vim script is in a subdirectory of this repo called vim.
	" " Pass the path to set the runtimepath properly.
	" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
	" " Avoid a name conflict with L9
	" Plugin 'user/L9', {'name': 'newL9'}

	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required

	" Brief help
	" :PluginList          - list configured plugins
	" :PluginInstall(!)    - install (update) plugins
	" :PluginSearch(!) foo - search (or refresh cache first) for foo
	" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
	"
	" see :h vundle for more details or wiki for FAQ
	" Put your non-Plugin stuff after this line

" }}}

" TODO unsorted ... {{{
	" map %% to dir name of currently active buffer file
	cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

	" php function text object
	vnoremap af :<C-U>normal va{Vo{<CR>
	omap af :normal Vaf<CR>

	set modeline
	set runtimepath+=~/.vim/

	" add HORIZONTAL ELLIPSIS (…) digraph
	digraphs 3. 8230
	" add DOUBLE EXCLAMATION MARK (‼) digraph
	digraphs !! 8252

	" http://vim.wikia.com/wiki/Ignore_white_space_in_vimdiff
	if &diff
		" diff mode
		set diffopt+=iwhite
	endif

	" load .vimrc upon every save
	if has("autocmd")
		autocmd BufWritePost .vimrc source $MYVIMRC
	endif

" }}}

" Key Mappings {{{

	" Other {{{

		" vimdiff upon: "W11: Warning: File xxx has changed since editing started"
		" taken from: http://stackoverflow.com/questions/8491110
		command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

		" I don't find Ex mode much useful, also it bothers me to write visual
		" all the time
		noremap Q <nop>

		" fix for screen / byobu (Del, Home, End)
		imap <ESC>[7~ <Home>

		" jj instead of esc
		inoremap jj <ESC>

		" count occurrences of last search
		nnoremap <leader>n :%s///gn <CR>

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
		" In the quickfix window, <CR> is used to jump to the error under the
		" cursor, so undefine the mapping there.
		autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

		" move the line with the tag definition at top of window when jumping
		map <C-]> <C-]>zt
		map g<LeftMouse> g<LeftMouse>zt

	" }}}

	" Leader Mappings {{{

		" The default leader is '\', but many people prefer ',' as it's in
		" a standard location
		let mapleader = ','

		" code folding
		map <leader>f :setlocal foldmethod=indent<CR><ESC>

		" Tabs listing
		map <leader>t :tabs<CR>

		" clearing highlighted search
		nmap <silent> <leader>/ :nohlsearch<CR>

		" edit .vimrc
		nmap <leader>v :tabedit $MYVIMRC<CR>

	" }}}

	" <F2> - <Fx> Mappings {{{

		" map remove trailing spaces, save all and session save here
		" TODO breaks last search pattern
		nmap <F2> :%s/\s\+$//e<CR>:wa<CR>:exe "mks! ".v:this_session<CR>
		imap <F2> <ESC><F2>

		" quit all
		map <F3> :qa<CR>
		map! <F3> <ESC>:wa<CR>

		" map paired tag closing
		inoremap <F4> </><ESC>m`2F<ye``PF<xF<i

		" toggle tagbar (tagbar plugin)
		map <F4> :TagbarToggle<CR>

		" toggle paste / nopaste
		set pastetoggle=<F5>
		nmap <F5> :set invpaste<bar>set paste?<CR>

		" toggle wrap / nowrap
		map <F6> :set invwrap<bar>set wrap?<CR>

		" php syntax validation
		map <F8> :!php -l %<CR>

		" open quickfix window, set number
		map <F9> :copen<bar>setlocal number<CR>

	" }}}

	" Windows and Tabs Switching {{{

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
		nnoremap <silent> l :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
		nnoremap <silent> h :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
	" }}}
" }}}

" General {{{
	filetype plugin indent on  	" Automatically detect file types.

	set encoding=utf8			" character encoding used inside Vim
	set fileencoding=utf8		" character encoding for the files
	let g:netrw_liststyle=3     " Use tree-mode as default view


	" Vim UI {{{

		colorscheme torte_custom		" my favorite colorscheme
		autocmd VimResized * wincmd =	" automatically resize win split on window resize
		autocmd BufWritePost * if &diff | diffupdate | endif	" update diff view if one of the files is saved
		autocmd BufWritePost *.md :syntax sync fromstart		" refresh syntax when markdown file is saved

		syntax on 						" syntax highlighting
		set mouse=a						" automatically enable mouse usage
		set history=100  				" Store more history (default is 20)
		set showmatch					" show matching brackets/parenthesis
		set incsearch					" find as you type search
		set hlsearch					" highlight search terms
		set ignorecase					" ignore case sensitivity in search
		set smartcase					" ...unless you include upper-case characters
		set wildmenu					" show list instead of just completing
		set wildmode=list:longest,full	" command <Tab> completion, list matches, then longest common part, then all.
		set scrolloff=3 				" minimum lines to keep above and below cursor
		set colorcolumn=80				" colorize 80th column (requires vim >= 7.3)
		set tabpagemax=30				" open max 30 tabs with vim -p * (default is 10)
		set showbreak=↪\ 				" line wrap symbol
		set sidescroll=1				" incrementally scroll one character at a time
		set sidescrolloff=6				" minimal number of screen columns to keep of the cursor if 'nowrap' is set

		if has('cmdline_info')
			set ruler					" show the ruler
			" set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
			set showcmd					" show partial commands in status line and
										" selected characters/lines in visual mode
		endif

		" Folding {{{
			function! FoldText()
				let foldsize = (v:foldend-v:foldstart)
				return '» ['.foldsize.' lines] » '.v:folddashes.getline(v:foldstart).' → '.getline(v:foldend)
			endfunction
			set foldtext=FoldText()
		" }}}

	" }}}

	" Formatting {{{
		set shiftwidth=4		" use indents of 4 spaces
		set tabstop=4 			" an indentation every four columns
		set smartindent			" smart autoindenting when starting a new line

	" }}}

" }}}

" Plugins {{{

	" Gundo {{{
		nnoremap <leader>g :GundoToggle<CR>
	" }}}

	" Commentary {{{
		nmap <C-_> :Commentary<CR>j
		vmap <C-_> :Commentary<CR>
	" }}}

	" Fugitive commands {{{
		set diffopt+=vertical
		nmap <leader>vc :Gcommit<CR>
		nmap <leader>vb :Gblame<CR>
		nmap <leader>vs :Gstatus<CR>
		nmap <leader>vv :Gdiff<CR>
	" }}}

	" php-doc commands {{{
		nnoremap <C-P> :call PhpDocSingle()<CR>
		vnoremap <C-P> :call PhpDocRange()<CR>
	" }}}

	" TagBar {{{
		let g:tagbar_autofocus = 1
		let g:tagbar_autoclose = 1
		let g:tagbar_type_php = {
			\ 'ctagstype' : 'php',
			\ 'kinds' : [
				\ 'i:interfaces',
				\ 'c:classes',
				\ 'd:constant definitions',
				\ 'f:functions',
				\ 'j:javascript functions:1'
				\ ]
			\ }
		let g:tagbar_left = 1
		let g:tagbar_compact = 1
		let g:tagbar_width = 30
		let g:tagbar_zoomwidth = 0
		let g:tagbar_iconchars = ['▷', '◢']
	" }}}

	" NERDTree {{{
		map <C-n> :NERDTreeToggle<CR>
	" }}}

" }}}

" Use local vimrc if available {{{
	if filereadable(expand("~/.vimrc.local"))
		source ~/.vimrc.local
	endif
" }}}
