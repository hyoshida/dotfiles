" vimshell prefix key.
nnoremap [vimshell] <Nop>
nmap <Space>v [vimshell]

" VimShellPopの際に縦分割で開く
let g:vimshell_popup_command = 'vsplit'

" プロンプトを変更
let g:vimshell_prompt_expr = '$USER."@".hostname()."[".escape(fnamemodify(getcwd(), ":~"), "\\[]()?! ")."]% "'
let g:vimshell_prompt_pattern = '^[^@]\+@[^@]\+\[\(\f\|\\.\)\+\]% '

" vimshellを縦分割して開く
noremap <silent> [vimshell]n :VimShellPop<CR>

" vimshellを開いている間のキーマッピング
autocmd FileType vimshell call s:vimshell_my_settings()
function! s:vimshell_my_settings()"{{{
	" Ctrl-Dで、文字があれば削除、なければ終了
	imap <silent><buffer><expr> <C-d> vimshell#get_cur_text() == '' ? "\<Plug>(vimshell_exit)" : "\<Del>"
endfunction"}}}
