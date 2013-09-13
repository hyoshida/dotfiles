" expand dir path
cmap <C-x> <c-r>=expand('%:h')<CR>/
" expand file path
cmap <C-z> <c-r>=expand('%')<CR>
" paste in command mode
cmap <C-y> <C-r>"

" Tabでバッファ移動
nmap <Tab> :bnext \| redraw<CR>
nmap <S-Tab> :bprev \| redraw<CR>

" レジスタの内容を置き換えずにペースト
" I haven't found how to hide this function (yet)
function! RestoreRegister()
	let @" = s:restore_reg
	return ''
endfunction
function! s:Repl()
	let s:restore_reg = @"
	return "p@=RestoreRegister()\<cr>"
endfunction
" NB: this supports "rp that replaces the selection by the
" contents of @r
vnoremap <silent> <expr> =p <sid>Repl()

" \eキーでファイルタイプにあったインタプリタを実行
au Filetype ruby       nnoremap <buffer><leader>e :!ruby %<Return>
au Filetype perl       nnoremap <buffer><leader>e :!perl %<Return>
au Filetype haskell    nnoremap <buffer><leader>e :!runghc %<Return>
au Filetype scheme     nnoremap <buffer><leader>e :!gosh %<Return>
au Filetype javascript nnoremap <buffer><leader>e :!js %<Return>
au Filetype vim        nnoremap <silent><leader>e :source %<Return>

" ウィンドウ分割操作をtmux風にする
" Ctrl-"でウィンドウを横分割 (like tmux)
nnoremap <silent> <C-w>" :split<CR>
" Ctrl-!でアクティブなウィンドウ以外を閉じる
nnoremap <silent> <C-w>! :only<CR>

" タブと空白をトグルする
" (from http://vim.wikia.com/wiki/Toggle_between_tabs_and_spaces)
function TabToggle()
	if &expandtab
		set shiftwidth=8
		set softtabstop=0
		set tabstop=8
		set noexpandtab
	else
		set shiftwidth=2
		set softtabstop=2
		set tabstop=2
		set expandtab
	endif
endfunction
nmap <F9> mz:execute TabToggle()<CR>'z
command TabToggle call TabToggle()
" インデント設定を初期化
call TabToggle()
