" タブを常に表示
set showtabline=2

" タブ操作を簡略化
"nnoremap <silent> tc :<C-u>tabnew<CR>
nnoremap <silent> tx :<C-u>tabclose<CR>
nnoremap <silent> te :<C-u>tabedit<CR>
nnoremap <silent> tf :<C-u>tabfirst<CR>
nnoremap <silent> tl :<C-u>tablast<CR>
nnoremap <silent> tn :<C-u>tabnext<CR>
nnoremap <silent> tN :<C-u>tabNext<CR>
nnoremap <silent> tp :<C-u>tabprevious<CR>
"nnoremap <silent> to :<C-u>tabonly<CR>
nnoremap <silent> ts :<C-u>tabs<CR>
cabbrev te tabe

"カレントウィンドウを新規タブで開き直す
nnoremap <C-w>t :call OpenNewTab()<CR>
function! OpenNewTab()
	let f = expand("%:p")
	execute ":q"
	execute ":tabnew " . f
endfunction

"カレントウィンドウのコピーを新規タブで開く
nnoremap <silent> tc :call OpenCopyTab()<CR><CR>
function! OpenCopyTab()
	let f = expand("%:p")
	execute ":tabedit"
	execute ":edit " . f
endfunction

" 1番目～ 9番目のタブへ移動
for i in range(1, 9)
	execute 'nnoremap <silent> t' . i . ' ' . i . 'gt'
endfor

" 現在のタブを右へ移動
nnoremap <silent> tk :CustomTabMoveRight<CR>
nnoremap <silent> tl :CustomTabMoveRight<CR>
" 現在のタブを左へ移動
nnoremap <silent> tj :CustomTabMoveLeft<CR>
nnoremap <silent> th :CustomTabMoveLeft<CR>

command! -count=1 CustomTabMoveRight call CustomTabMove(<count>)
command! -count=1 CustomTabMoveLeft  call CustomTabMove(-<count>)

function! CustomTabMove(c)
	let current = tabpagenr()
	let max = tabpagenr('$')
	let target = a:c > 1 ? current + a:c - line('.') - 2 :
		\ a:c == 1   ? current :
		\ a:c == -1  ? current - 2 :
		\ a:c < -1   ? current + a:c + line('.') - 2 : 0
	let target = target >= max ? target % max :
		\ target < 0 ? target + max :
		\ target
	execute ':tabmove ' . target
endfunction

" タブ番号:バッファ名
set tabline=%!CustomTabLine()

function CustomTabLine()
	let tabline = ''
	for i in range(tabpagenr('$'))
		let tabnr = i + 1
		"Select the color group for highlighting active tab
		if tabnr == tabpagenr()
			let tabline .= '%#TabLineSel#'
		else
			let tabline .= '%#TabLine#'
		endif

		"Find the buffername for the tablabel
		let tabline .= CustomTabLabel(tabnr)
	endfor
	"After the last tab fill with TabLineFill and reset tab page #
	let tabline .= '%#TabLineFill#%T'
	return tabline
endfunction

function CustomTabLabel(tabnr)
	let buflist = tabpagebuflist(a:tabnr)
	let winnr = tabpagewinnr(a:tabnr)
	let bufname = bufname(buflist[winnr - 1])
	let filepath = fnamemodify(bufname, ':.')

	let modified = ''
	for bufnr in buflist
		if getbufvar(bufnr, "&modified")
			let modified = '*'
			break
		endif
	endfor

	let prefix = a:tabnr . ':'
	let postfix = modified . ' '
	let label = prefix . filepath . postfix
	let width = (&columns / tabpagenr('$'))
	if strlen(' ' . label) >= width
		let shortpath = pathshorten(filepath)
		let pathoffset = strlen(' ' . prefix . shortpath . postfix) - width
		if pathoffset < 0
			let pathoffset = 0
		endif
		let label = prefix . shortpath[pathoffset : ] . postfix
	endif
	return '%' . a:tabnr . 'T ' . label
endfunction

" When starting Vim, the -p option opens each specified file in a
" separate tab (up to the value of the 'tabpagemax' option)
set tabpagemax=50
