" カラー対応してそうなら256色で表示
if $TERM =~ '^\(xterm\|screen\)'
	set t_Co=256
endif

" 256色に対応しているならテーマ適用
if &t_Co >= 256
	colorscheme Monokai

	highlight Pmenu ctermfg=252 ctermbg=235
	highlight PmenuSel ctermfg=255 ctermbg=240
	highlight TabLine ctermfg=Black ctermbg=240
	highlight TabLineFill term=reverse cterm=reverse ctermfg=236
	highlight Visual ctermbg=236
	highlight Normal ctermbg=232
	highlight NonText ctermbg=233
	highlight SpecialKey ctermbg=none
	highlight LineNr ctermbg=234
	highlight FoldColumn ctermbg=234
	highlight VertSplit ctermbg=233

	" C言語向け
	highlight Type ctermfg=81 guifg=#66d9ef
	highlight Constant ctermfg=81 guifg=#66d9ef
endif

" 全角スペースの視覚化
highlight ZenkakuSpace cterm=underline ctermfg=DarkBlue guibg=DarkGray
match ZenkakuSpace /　/
