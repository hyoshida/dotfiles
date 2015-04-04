if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Utils
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'tsaleh/vim-matchit'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tinymode.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'chrisbra/csv.vim'

" Text-editing
NeoBundle 'vim-scripts/VisIncr'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'Align'

" unite.vim
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'basyura/unite-rails'
NeoBundle 'Shougo/neomru.vim'

" UI
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'severin-lemaignan/vim-minimap'

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
NeoBundle 'digitaltoad/vim-jade'

" Colros
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'sickill/vim-monokai'

" hyoshida plugins
NeoBundle 'hyoshida/unite-cmus'
