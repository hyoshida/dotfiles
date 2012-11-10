syntax on
filetype plugin indent on

" ビープ音を鳴らさない
set vb t_vb=

" 行番号を表示する
"set number
" ルーラーを表示
set ruler
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
" Listモードに使われる文字を設定する
set listchars=tab:>.,extends:<

" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan
" 検索結果文字列のハイライトを有効にする
set hlsearch
" <Esc> 連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" コメント文の色を変更
highlight Comment ctermfg=DarkCyan

" 入力されているテキストの最大幅(行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap
" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=DarkBlue guibg=DarkGray
match ZenkakuSpace /　/

" オートインデントを有効にする
"set autoindent
" タブが対応する空白の数
"set tabstop=4
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
"set softtabstop=4
" インデントの各段階に使われる空白の数
"set shiftwidth=4
" タブを挿入するとき、代わりに空白を使わない
set noexpandtab

"if has("autocmd")
"	" ファイルタイプ別インデント、プラグインを有効にする
"	filetype plugin indent on
"endif

" デフォルトの文字コード(短縮名 'enc')
set encoding=utf-8
" 文字コード自動判別のためのリスト(短縮名 'fencs')
set fileencodings=iso-2022-jp,euc-jp,utf-8,sjis

" ステータス行の表示
set laststatus=2
" ステータス行の内容を変更
set statusline=%<%f\ %m%r%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l/%L,%v

""filetype off
""call pathogen#runtime_append_all_bundles()
""filetype on
"call pathogen#infect()

" コメントアウト文字の自動挿入を無効化
autocmd FileType * setlocal formatoptions-=ro

" expand dir path
cmap <C-x> <c-r>=expand('%:h')<CR>/
" expand file path
cmap <C-z> <c-r>=expand('%')<CR>

" コマンドモード時にカーソル移動を emacs 形式にする
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-f> <Right>
cmap <C-b> <Left>

" vim7
if v:version >= 700
	" タブを常に表示
	set showtabline=2

	" タブ操作を簡略化
	nnoremap <silent> tc :<C-u>tabnew<CR>
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
	nnoremap <silent> tt :call OpenCopyTab()<CR><CR>
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
endif
