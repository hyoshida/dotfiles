if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Utils
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
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
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tinymode.vim'
NeoBundle 'vim-scripts/VisIncr'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'chrisbra/csv.vim'

" unite.vim
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'basyura/unite-rails'

" UI
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'lilydjwg/colorizer'

" Snippets
NeoBundle 'Shougo/neosnippet'
NeoBundle 'honza/vim-snippets'

" For text-object
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'tyru/operator-camelize.vim'

" Languages
NeoBundle 'ecomba/vim-ruby-refactoring'
NeoBundle 'tpope/vim-rails'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'sophacles/vim-processing'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'othree/html5.vim'
NeoBundle 'hyoshida/vim-artemis'

" Colros
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'sickill/vim-monokai'

" hyoshida plugins
NeoBundle 'hyoshida/unite-cmus'
