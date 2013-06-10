if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tsaleh/vim-matchit'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'snipmate-snippets'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tinymode.vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'sophacles/vim-processing'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'Shougo/vimproc', {
	\ 'build' : {
	\     'windows' : 'make -f make_mingw32.mak',
	\     'cygwin'  : 'make -f make_cygwin.mak',
	\     'mac'     : 'make -f make_mac.mak',
	\     'unix'    : 'make -f make_unix.mak',
	\ },
\ }
