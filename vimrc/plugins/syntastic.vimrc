" Recommended settings
" from: https://github.com/scrooloose/syntastic#3-recommended-settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" for Ruby
if has('ruby')
	let g:syntastic_ruby_checkers = ['mri', 'rubocop']
	let g:syntastic_ruby_rubocop_exec = expand('~/dotfiles/.bin/rubocop')
end
