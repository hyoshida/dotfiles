" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
	if &compatible
		set nocompatible " be iMproved
	endif
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Utils
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc', {
	\ 'build' : {
	\     'windows' : 'tools\\update-dll-mingw',
	\     'cygwin'  : 'make -f make_cygwin.mak',
	\     'mac'     : 'make -f make_mac.mak',
	\     'linux'   : 'make',
	\     'unix'    : 'gmake',
	\ },
\ }
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tinymode.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'tpope/vim-dispatch' " for OmniSharp
NeoBundle 'Shougo/neocomplete'

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
NeoBundle 'Shougo/neosnippet-snippets'
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
NeoBundle 'joker1007/vim-ruby-heredoc-syntax'
NeoBundleLazy 'OmniSharp/omnisharp-vim', {
\   'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] },
\   'build': {
\     'windows' : 'msbuild server/OmniSharp.sln',
\     'mac': 'xbuild server/OmniSharp.sln',
\     'unix': 'xbuild server/OmniSharp.sln',
\   },
\ }

" Colros
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'sickill/vim-monokai'

" Lint
NeoBundle 'scrooloose/syntastic'

" hyoshida plugins
NeoBundle 'hyoshida/unite-cmus'

" Load Settings
function s:source_lazy(name, path)
	let bundle = neobundle#get(a:name)
	execute join([
		\ 'function! bundle.hooks.on_post_source(bundle)',
		\ '	source ' . a:path,
		\ 'endfunction',
		\ ], "\n")
endfunction
call s:source_lazy('vimshell', '~/dotfiles/config/vimshell.vimrc')
call s:source_lazy('vimfiler', '~/dotfiles/config/vimfiler.vimrc')
call s:source_lazy('unite.vim', '~/dotfiles/config/unite.vimrc')
call s:source_lazy('vim-quickrun', '~/dotfiles/config/quickrun.vimrc')
call s:source_lazy('tinymode.vim', '~/dotfiles/config/tinymode.vimrc')
call s:source_lazy('neosnippet', '~/dotfiles/config/neosnippet.vimrc')
call s:source_lazy('vim-fugitive', '~/dotfiles/config/fugitive.vimrc')
call s:source_lazy('switch.vim', '~/dotfiles/config/switch.vimrc')
call s:source_lazy('vim-powerline', '~/dotfiles/config/vim-powerline.vimrc')
call s:source_lazy('operator-camelize.vim', '~/dotfiles/config/operator-camelize.vimrc')
call s:source_lazy('syntastic', '~/dotfiles/config/syntastic.vimrc')
call s:source_lazy('neocomplete', '~/dotfiles/config/neocomplete.vimrc')
call s:source_lazy('omnisharp-vim', '~/dotfiles/config/omnisharp.vimrc')
call s:source_lazy('vim-minimap', '~/dotfiles/config/vim-minimap.vimrc')

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
