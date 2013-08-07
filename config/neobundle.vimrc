if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Utils
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-rsense'
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
NeoBundle 'tsaleh/vim-matchit'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tinymode.vim'
NeoBundle 'vim-scripts/VisIncr'

" Snippets
NeoBundle 'Shougo/neosnippet'
NeoBundle 'snipmate-snippets'

" For text-object
NeoBundle 'tpope/vim-surround'

" Languages
NeoBundle 'ecomba/vim-ruby-refactoring'
NeoBundle 'tpope/vim-rails'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'sophacles/vim-processing'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'othree/html5.vim'

" Colros
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'jpo/vim-railscasts-theme'
