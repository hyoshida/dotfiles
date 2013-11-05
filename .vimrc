let s:is_supported_tabline = (v:version >= 700)
let s:can_neobundle = (v:version >= 702)

" ===== NeoBundle =====
set nocompatible " be iMproved
filetype off
if s:can_neobundle
	source ~/dotfiles/config/neobundle.vimrc
endif
syntax on
filetype plugin indent on
" ===== /NeoBundle ======

source ~/dotfiles/config/setting.vimrc
source ~/dotfiles/config/encoding.vimrc
source ~/dotfiles/config/color.vimrc
source ~/dotfiles/config/keybind.vimrc
source ~/dotfiles/config/binary.vimrc

if s:is_supported_tabline
	source ~/dotfiles/config/tabline.vimrc
endif

if s:can_neobundle
	source ~/dotfiles/config/vimshell.vimrc
	source ~/dotfiles/config/vimfiler.vimrc
	source ~/dotfiles/config/unite.vimrc
	source ~/dotfiles/config/quickrun.vimrc
	source ~/dotfiles/config/tinymode.vimrc
	source ~/dotfiles/config/neocomplcache.vimrc
	source ~/dotfiles/config/neosnippet.vimrc
	source ~/dotfiles/config/fugitive.vimrc
	source ~/dotfiles/config/switch.vimrc
	source ~/dotfiles/config/vim-powerline.vimrc
	source ~/dotfiles/config/operator-camelize.vimrc
endif
