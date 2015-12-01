" vimshell prefix key.
nnoremap [vimshell] <Nop>
vnoremap [vimshell] <Nop>
nmap <Leader>v [vimshell]
vmap <Leader>v [vimshell]

" VimShellPopの際に縦分割で開く
let g:vimshell_popup_command = 'vsplit'

" プロンプトを変更
let g:vimshell_prompt_expr = '$USER."@".hostname()."[".escape(fnamemodify(getcwd(), ":~"), "\\[]()?! ")."]% "'
let g:vimshell_prompt_pattern = '^[^@]\+@[^@]\+\[\(\f\|\\.\)\+\]% '

" インタプリタの更新間隔を短くする (Default: 500)
let g:vimshell_interactive_update_time = 50

" vimshellを分割して開く
nnoremap <silent> [vimshell]n :VimShellPop<CR>
" 現在のバッファの内容を非同期インタプリタで評価
nnoremap <silent> [vimshell]e ggVG:VimShellSendString<CR>
" 選択行を非同期インタプリタで評価
vnoremap <silent> [vimshell]e :VimShellSendString<CR>

" vimshellを開いている間のキーマッピング
autocmd FileType vimshell call s:vimshell_my_settings()
function! s:vimshell_my_settings()"{{{
	" Ctrl-Dで、文字があれば削除、なければ終了
	imap <silent><buffer><expr> <C-d> vimshell#get_cur_text() == '' ? "\<Plug>(vimshell_exit)" : "\<Del>"
endfunction"}}}
