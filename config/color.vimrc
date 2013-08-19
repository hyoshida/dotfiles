" 256色で表示
set t_Co=256

colorscheme Monokai

highlight Pmenu ctermfg=252 ctermbg=235
highlight PmenuSel ctermfg=255 ctermbg=240
highlight TabLine ctermfg=Black ctermbg=240
highlight TabLineFill term=reverse cterm=reverse ctermfg=236
highlight Visual ctermbg=236
highlight Normal ctermbg=232
highlight NonText ctermbg=233
highlight SpecialKey ctermbg=none
highlight LineNr ctermbg=234
highlight FoldColumn ctermbg=234
highlight VertSplit ctermbg=233

" 全角スペースの視覚化
highlight ZenkakuSpace cterm=underline ctermfg=DarkBlue guibg=DarkGray
match ZenkakuSpace /　/
