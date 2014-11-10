" ビープ音を鳴らさない
set vb t_vb=

" 行番号を表示する
set number
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
set timeout timeoutlen=1000 ttimeoutlen=50
" <Esc> 連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 入力されているテキストの最大幅(行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" 自動折りたたみを無効化
autocmd FileType * :set foldmethod=manual
autocmd FileType * :set foldlevel=1
autocmd FileType * :set foldnestmax=2

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

" 新しいウィンドウを現在のウィンドウの下か右に開く
set splitbelow
set splitright

" :vimgrep, :grep などで常に Quickfix を開くようにする
autocmd QuickFixCmdPost *grep* cwindow
