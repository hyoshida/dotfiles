" 現在表示中のファイルのタグのみ表示
let Tlist_Show_One_File = 1

" Tlistを右側に表示
let Tlist_Use_Right_Window = 1

" ウィンドウにTlistだけなら閉じる
let Tlist_Exit_OnlyWindow = 1

" Tlistを開いたらフォーカスも合わせる
let Tlist_GainFocus_On_ToggleOpen = 1

" \tでTlistを開く
map <silent> <leader>t :TlistOpen<CR>
