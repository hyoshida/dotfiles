let s:is_supported_tabline = (v:version >= 700)
let s:can_neobundle = (v:version >= 702)

" ===== NeoBundle =====
filetype off
if s:can_neobundle
	source ~/dotfiles/vimrc/neobundle.vimrc
	source ~/dotfiles/vimrc/neobundle-settings.vimrc
endif
syntax on
" ===== /NeoBundle ======

source ~/dotfiles/vimrc/setting.vimrc
source ~/dotfiles/vimrc/encoding.vimrc
source ~/dotfiles/vimrc/color.vimrc
source ~/dotfiles/vimrc/keybind.vimrc
source ~/dotfiles/vimrc/binary.vimrc
source ~/dotfiles/vimrc/mark.vimrc
source ~/dotfiles/vimrc/vim-matchit.vimrc

if s:is_supported_tabline
	source ~/dotfiles/vimrc/tabline.vimrc
endif
