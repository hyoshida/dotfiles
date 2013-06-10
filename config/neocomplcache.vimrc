" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" Tabキーで補完候補の選択をで行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"

" Enterでポップアップを削除して改行
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"

" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion  =  1

" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3
