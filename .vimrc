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

if s:can_neobundle
	source ~/dotfiles/config/vimshell.vimrc
	source ~/dotfiles/config/vimfiler.vimrc
	source ~/dotfiles/config/unite.vimrc
	source ~/dotfiles/config/quickrun.vimrc
	source ~/dotfiles/config/tinymode.vimrc
	source ~/dotfiles/config/neosnippet.vimrc
	source ~/dotfiles/config/fugitive.vimrc
	source ~/dotfiles/config/switch.vimrc
	source ~/dotfiles/config/vim-powerline.vimrc
	source ~/dotfiles/config/operator-camelize.vimrc
	source ~/dotfiles/config/syntastic.vimrc

	if has('lua')
		source ~/dotfiles/config/neocomplete.vimrc
	end

	if has('python') || has('python3')
		source ~/dotfiles/config/omnisharp.vimrc
		source ~/dotfiles/config/vim-minimap.vimrc
	end
endif
