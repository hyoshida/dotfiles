" -でスイッチを実施
nnoremap - :Switch<cr>

"  under_score <-> camelCase
let g:variable_style_switch_definitions = [
	\ {
	\     '\<[a-z0-9]\+_\k\+\>': {
	\         '_\(.\)': '\U\1'
	\     },
	\     '\<[a-z0-9]\+[A-Z]\k\+\>': {
	\         '\([A-Z]\)': '_\l\1'
	\     },
	\ }
\ ]
nnoremap + :call switch#Switch(g:variable_style_switch_definitions)<cr>

" 独自のスイッチを定義
let g:switch_custom_definitions = [
	\ [ 'if', 'unless' ]
\ ]
