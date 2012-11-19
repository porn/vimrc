" Modeline and Notes {
"	vim: set foldmarker={,} foldlevel=0 foldmethod=marker
"
"	Hosted on github: TODO
" }

" TODO unsorted ... {
	runtime! debian.vim

	set runtimepath+=~/.vim/

	" php offline manuals
	set runtimepath+=~/.vim/doc
	autocmd BufNewFile,Bufread *.php,*.php3,*.php4 set keywordprg="help"

	" oblibene barevne schema
	colorscheme torte_custom

	" C-] vystredi radku na kterou se skace
	map  zt

	" load .vimrc upon every save
	if has("autocmd")
		autocmd BufWritePost .vimrc source $MYVIMRC
	endif

	" V insert módu použije po stisku tabulátoru patřičný počet mezer místo
	" vložení znaku pro tabulátor. Mezery se místo tabulátoru vkládají také při
	" automatickém odsazování a odsazování pomocí příkazů < a >. Zdá se mi
	" přirozenější pro odsazování používat mezery než tabulátory, protože pak máte
	" jistotu, že váš kód bude vypadat všude stejně. Pokud chcete do souboru přece
	" jenom vložit znak tabulátoru (např. při editování souboru Makefile, kde je
	" nezbytným), můžete použít CTRL-V a Tab.
	"set expandtab


	" Zavede se navíc "trochu chytřejší odsazování" - např. VIM automaticky zvětší
	" odsazení po řádku končícím "{" nebo upraví odsazení po napsání "}" na
	" začátku nového řádku.
	set smartindent

	" Nastaveni kodovani
	set encoding=utf8
	set fileencoding=utf8

	" wget  http://ftp.linux.cz/pub/localization/OpenOffice.org/devel/Czech/spell_checking/cs_CZ.zip
	" unzip -x cs_CZ.zip cs_CZ.aff cs_CZ.dic
	" vim -e -s << EOF
	" :mkspell cs cs_cz
	" :!cp cs.utf-8.spl $VIMRUNTIME/spell
	" EOF
	" Posleze nastavit:
	" set spelllang=cs
	" Je mozne kontrolovat i vicejazycny text:
	" set spelllang=cs,en
	" pro zvyrazneni slov pouzit:
	" set spell
	set spelllang=cs

	" }

" Key Mappings {

	" Other {

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
		map <F2> mq:%s/\s\+$//e<CR>:wa<CR>:exe "mks! ".v:this_session<CR>
		map! <F2> <ESC> mq:%s/\s\+$//e<CR>:wa<CR>:exe "mks! ".v:this_session<CR>

		" quit all
		map <F3> :qa<CR>
		map! <F3> <ESC>:wa<CR>

		" map paired tag closing (TODO: make work with one character tags)
		" imap <F4> </><ESC>2F<lyef>f/pF<i
		imap <F4> </><ESC>2F<lywf>f/pF<i

		" toggle taglist (taglist plugin)
		map <F4> :TlistToggle<CR>

		" toggle paste / nopaste
		map <F5> :set invpaste<bar>set paste?<CR>
		map! <F5> <ESC>:set invpaste<bar>set paste?<CR>i

		" toggle wrap / nowrap
		map <F6> :set invwrap<bar>set wrap?<CR>

		" php syntax validation
		map <F8> :!php -l %<CR>

		" open quickfix window, set it modifiable and having number
		map <F9> :cw<bar>set invmodifiable<bar>set invnumber<CR>

	" }

	" Windows and Tabs Mappings {

		" Easier moving in tabs
		map <S-H> gT
		map <S-L> gt

		" Easier moving in windows
		map <C-J> <C-W>j
		map <C-H> <C-W>h

		" switching to left/right also re-draws the screen
		noremap <C-K> <C-W>k<C-L>
		noremap <C-L> <C-W>l<C-L>

	" }
" }

" General {
	filetype plugin indent on  	" Automatically detect file types.
	syntax on 					" syntax highlighting
	set mouse=a					" automatically enable mouse usage
	set history=100  			" Store a ton of history (default is 20)

	" Vim UI {

		" colorize 80th column (requires vim >= 7.3)
		if exists('+colorcolumn')
			set colorcolumn=80
		endif

		if has('cmdline_info')
			set ruler                  	" show the ruler
			" set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
			set showcmd                	" show partial commands in status line and
										" selected characters/lines in visual mode
		endif

		set showmatch					" show matching brackets/parenthesis
		set incsearch					" find as you type search
		set hlsearch					" highlight search terms
		set wildmenu					" show list instead of just completing
		set wildmode=list:longest,full	" command <Tab> completion, list matches, then longest common part, then all.
		set scrolloff=3 				" minimum lines to keep above and below cursor


	" }

	" Formatting {
		set shiftwidth=4               	" use indents of 4 spaces
		set tabstop=4 					" an indentation every four columns
	" }

" }

" Plugins {

	" VCS commands {
		nmap <leader>vs :VCSStatus<CR>
		nmap <leader>vc :VCSCommit<CR>
		nmap <leader>vb :VCSBlame<CR>
		nmap <leader>va :VCSAdd<CR>
		nmap <leader>vd :VCSDiff<CR>
		nmap <leader>vl :VCSLog<CR>
		nmap <leader>vu :VCSUpdate<CR>
		nmap <leader>vv :VCSVimDiff<CR>
	" }

	" php-doc commands {
		nnoremap <C-P> :call PhpDocSingle()<CR>
		vnoremap <C-P> :call PhpDocRange()<CR>
	" }

" }

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }
