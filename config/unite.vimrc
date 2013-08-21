""" settings for unite.vim

"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

" 入力モードで開始する
let g:unite_enable_start_insert = 1

" 画面分割ルール: 下 or 右に表示する
let g:unite_split_rule = 'rightbelow'

" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=buffer buffer<CR>
" ファイル一覧
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=file file<CR>
" レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>
" 常用セット
nnoremap <silent> [unite]u :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=all buffer file_mru bookmark file<CR>
" カラースキーム選択
nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=colorscheme colorscheme -auto-preview<CR>
" unite-line: ファイル内検索
nnoremap <silent> [unite]l :<C-u>Unite -buffer-name=line line -vertical<CR>
" unite-grep: grep検索
nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep<CR>
" unite-outline: 見出し検索
nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline outline -vertical<CR>

"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
	"ESCでuniteを終了
	nmap <buffer> <ESC> <Plug>(unite_exit)
	"入力モードのときctrl+wでバックスラッシュも削除
	imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
	"入力モードのときTabでファイル選択
	imap <buffer> <Tab> <CR>
	"ctrl+jで縦に分割して開く
	nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('vsplit')
	inoremap <silent> <buffer> <expr> <C-j> unite#do_action('vsplit')
	"ctrl+lで横に分割して開く
	nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')
	inoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')
	"ctrl+oでその場所に開く
	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
	inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

" デフォルトアクション変更: ファイルは新しいタブで開く
call unite#custom_default_action('file', 'tabopen')
