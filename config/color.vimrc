" 256色で表示
set t_Co=256

highlight Comment ctermfg=DarkCyan
highlight Search term=reverse cterm=reverse ctermfg=Yellow ctermbg=16
highlight Pmenu ctermfg=252 ctermbg=235
highlight PmenuSel ctermfg=255 ctermbg=240
highlight Visual term=reverse cterm=reverse ctermbg=Black
highlight TabLine ctermfg=Black ctermbg=240
highlight TabLineFill term=reverse cterm=reverse ctermfg=236

" 全角スペースの視覚化
highlight ZenkakuSpace cterm=underline ctermfg=DarkBlue guibg=DarkGray
match ZenkakuSpace /　/
