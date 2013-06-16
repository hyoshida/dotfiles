if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Utils
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
	\ 'build' : {
	\     'windows' : 'make -f make_mingw32.mak',
	\     'cygwin'  : 'make -f make_cygwin.mak',
	\     'mac'     : 'make -f make_mac.mak',
	\     'unix'    : 'make -f make_unix.mak',
	\ },
\ }
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'tsaleh/vim-matchit'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tinymode.vim'
NeoBundle 'snipmate-snippets'

" Language
NeoBundle 'tpope/vim-rails'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'sophacles/vim-processing'
NeoBundle 'kchmck/vim-coffee-script'

" Colros
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'jpo/vim-railscasts-theme'
