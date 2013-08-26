" :G**系のエイリアス作成
command -nargs=* Grm Gremove <args>
command -nargs=* Gci Gcommit <args>

" :gitで:Gitを使えるようにする
cabbrev git Git

" :Gstatus時のキーバインド
autocmd FileType gitcommit call s:gitcommit_custom_keybinds()
function! s:gitcommit_custom_keybinds()"{{{
	" Ctrl-jでカーソル行のファイルを縦分割で表示
	nmap <buffer> <C-j> S
endfunction"}}}
