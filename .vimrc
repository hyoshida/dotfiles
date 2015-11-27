let s:is_supported_tabline = (v:version >= 700)
let s:can_neobundle = (v:version >= 702)

" ===== NeoBundle =====
filetype off
if s:can_neobundle
	source ~/dotfiles/config/neobundle.vimrc
endif
syntax on
" ===== /NeoBundle ======

source ~/dotfiles/config/setting.vimrc
source ~/dotfiles/config/encoding.vimrc
source ~/dotfiles/config/color.vimrc
source ~/dotfiles/config/keybind.vimrc
source ~/dotfiles/config/binary.vimrc
source ~/dotfiles/config/mark.vimrc
source ~/dotfiles/config/vim-matchit.vimrc

if s:is_supported_tabline
	source ~/dotfiles/config/tabline.vimrc
endif
