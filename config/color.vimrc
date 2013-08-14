" 256色で表示
set t_Co=256

colorscheme Monokai

highlight TabLine ctermfg=Black ctermbg=240
highlight TabLineFill term=reverse cterm=reverse ctermfg=236
highlight Visual ctermbg=235
highlight Normal ctermbg=232
highlight NonText ctermbg=233
highlight SpecialKey ctermbg=none
highlight LineNr ctermbg=234

" 全角スペースの視覚化
highlight ZenkakuSpace cterm=underline ctermfg=DarkBlue guibg=DarkGray
match ZenkakuSpace /　/
