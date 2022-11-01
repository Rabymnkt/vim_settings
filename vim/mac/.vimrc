call plug#begin('~/.vim/plugged')
Plug 'sainnhe/gruvbox-material'
call plug#end()

" vim-plug のインストール（vim用）は
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" を実行（詳しくはこちら→ https://github.com/junegunn/vim-plug）

" colorscheme の設定前に全角スペースの強調表示の設定をしないとエラーが出る．
" 全角スペースの背景を赤に変更
autocmd Colorscheme * highlight FullWidthSpace guibg=darkcyan
autocmd VimEnter * match FullWidthSpace /　/

if has('termguicolors')
  set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
let g:airline_theme = 'gruvbox_material'

" leader キーの変更
let mapleader = "\<Space>"

" バッファ移動のショートカットキー設定
set hidden
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>

" シンタックスハイライト
syntax on
" set t_Co=256

" クリップボード連携設定
set clipboard&
set clipboard^=unnamedplus

set hidden

" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定(neovimでは有効にすると画面がおかしくなった)
"set ambiwidth=double
" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu

set belloff=all

"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch
" ハイライトされた文字の色と背景色を指定
" 設定できる具体的な色に関してはコマンドで
" :so $VIMRUNTIME/syntax/colortest.vim
" を実行して確認できる

" 検索のハイライト
hi Search guibg=lightgreen
hi Search guifg=black

" diffのハイライト
" hi DiffAdd guibg=darkgreen
" hi DiffAdd guifg=white
" hi DiffChange guibg=darkcyan
" hi DiffChange guifg=white

"----------------------------------------
" 表示設定
"----------------------------------------
" ファイルを下に開く
set splitbelow
" ファイルを右に開く
set splitright
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" Windowsでパスの区切り文字をスラッシュで扱う
set shellslash
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" インデント方法の変更
set cinoptions+=:0
" メッセージ表示欄を2行確保
set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 省略されずに表示
set display=lastline
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
" コマンドラインの履歴を10000件保存する
set history=10000
" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab
" インデント幅
set shiftwidth=4
" タブキー押下時に挿入される文字幅を指定
set softtabstop=4
" ファイル内にあるタブ文字の表示幅
set tabstop=4
" ツールバーを非表示にする
set guioptions-=T
" yでコピーした時にクリップボードに入る
set guioptions+=a
" メニューバーを非表示にする
set guioptions-=m
" 右スクロールバーを非表示
set guioptions-=R
" 対応する括弧を強調表示
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
" set smartindent
"改行時に，ブロックに応じて自動でインデントを挿入する
"set autoindent
"改行時に，ブロックに応じて自動でインデントを挿入しない
"set noautoindent
" set nosmartindent
"set nocindent
" スワップファイルを作成しない
set noswapfile
" 検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
" タイトルを表示
set title
" 行番号, 相対行番号の表示
set number relativenumber
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" すべての数を10進数として扱う
set nrformats=

hi Comment ctermfg=gray

if has('mouse')
  set mouse=a
endif
