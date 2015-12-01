" :G**系のエイリアス作成
command -nargs=* Grm Gremove <args>
command -nargs=* Gci Gcommit <args>

" :Gstatus時のキーバインド
autocmd FileType gitcommit call s:gitcommit_custom_keybinds()
function! s:gitcommit_custom_keybinds()"{{{
	" Ctrl-jでカーソル行のファイルを縦分割で表示
	nmap <buffer> <C-j> S
endfunction"}}}

" fugitive prefix key.
nnoremap [fugitive] <Nop>
nmap <Leader>g [fugitive]

nnoremap <silent> [fugitive]st :<C-u>Gstatus<CR>
nnoremap <silent> [fugitive]ci :<C-u>Gcommit<CR>
nnoremap <silent> [fugitive]di :<C-u>Gdiff<CR>
nnoremap <silent> [fugitive]bl :<C-u>Gblame<CR>
nnoremap <silent> [fugitive]log :<C-u>!git log<CR>
nnoremap <silent> [fugitive]ls :<C-u>!git ls<CR>
nnoremap <silent> [fugitive]la :<C-u>!git la<CR>
nnoremap <silent> [fugitive]br :<C-u>!git br<CR>
nnoremap [fugitive]rep :<C-u>Ggrep <C-R>=expand("<cword>")<CR>
