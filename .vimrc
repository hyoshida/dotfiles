" ===== NeoBundle =====
set nocompatible " be iMproved
filetype off
source ~/dotfiles/config/neobundle.vimrc
syntax on
filetype plugin indent on
" ===== /NeoBundle ======

source ~/dotfiles/config/setting.vimrc
source ~/dotfiles/config/encoding.vimrc
source ~/dotfiles/config/color.vimrc
source ~/dotfiles/config/keybind.vimrc
source ~/dotfiles/config/binary.vimrc

if v:version >= 700
	source ~/dotfiles/config/tabline.vimrc
endif

source ~/dotfiles/config/unite.vimrc
source ~/dotfiles/config/quickrun.vimrc
source ~/dotfiles/config/tinymode.vimrc
source ~/dotfiles/config/neocomplcache.vimrc
