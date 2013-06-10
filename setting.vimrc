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
" インクリメンタルサーチを有効にする
set incsearch
" 検索結果文字列のハイライトを有効にする
set hlsearch
" <Esc> で素早くノーマルモードに移行
set timeout timeoutlen=1000 ttimeoutlen=0
" <Esc> 連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 入力されているテキストの最大幅(行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

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

" タブ幅は拡張子を問わずに統一
au BufNewFile,BufRead * setlocal tabstop=8 shiftwidth=8

" 自動折りたたみを無効化
set foldlevel=100

" デフォルトの文字コード(短縮名 'enc')
set encoding=utf-8
" 文字コード自動判別のためのリスト(短縮名 'fencs')
set fileencodings=iso-2022-jp,euc-jp,utf-8,sjis

" ステータス行の表示
set laststatus=2
" ステータス行の内容を変更
set statusline=%<%f\ %m%r%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l/%L,%v
"set statusline=%{expand('%:p:t')}\ %<[%{expand('%:p:h')}]%=\ %m%r%y%w[%{&fenc!=''?&fenc:&enc}][%{&ff}][%3l,%3c,%3p]
"" ファイルへの相対パスを表示する
let g:Powerline_stl_path_style = 'relative'

" コメントアウト文字の自動挿入を無効化
autocmd FileType * setlocal formatoptions-=ro

" インサートモード時の「削除」の定義を変更
set backspace=start,eol,indent

" tagsで読み込むファイルを限定
set tags=~/.tags,gems.tags
