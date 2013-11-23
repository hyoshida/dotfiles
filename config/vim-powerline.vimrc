let g:Powerline_symbols = 'compatible'

if filereadable(expand('~/dotfiles/tmp/enable_powerline.txt'))
	let g:Powerline_dividers_override = [ [0xe0b0], [0xe0b1], [0xe0b2], [0xe0b3] ]
	let g:Powerline_symbols_override = {
		\ 'BRANCH': [0xe0a0],
		\ 'RO'    : [0xe0a2],
		\ 'LINE'  : [0xe0a1]
	\ }
endif

" 256色に対応していない場合は16色向けのテーマを適用
if &t_Co < 256
	let g:Powerline_theme = 'solarized16'
endif
