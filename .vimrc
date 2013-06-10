" ===== NeoBundle =====
set nocompatible " be iMproved
filetype off
source ~/dotfiles/noebundle.vimrc
syntax on
filetype plugin indent on
" ===== /NeoBundle ======

source ~/dotfiles/setting.vimrc
source ~/dotfiles/encoding.vimrc
source ~/dotfiles/color.vimrc
source ~/dotfiles/keybind.vimrc
source ~/dotfiles/binary.vimrc

if v:version >= 700
	source ~/dotfiles/tabline.vimrc
endif

source ~/dotfiles/unite.vimrc
source ~/dotfiles/quickrun.vimrc
source ~/dotfiles/tinymode.vimrc
source ~/dotfiles/neocomplcache.vimrc
