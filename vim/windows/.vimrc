set background=dark
colorscheme hybrid
let g:lightline = {'colorscheme': 'wombat'}

" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}

if !has('gui_running')
  set t_Co=256
endif

syntax enable
filetype plugin indent on

"vimをvi互換にしないための設定(これを有効化することでvimの便利な機能を使うことができる)
set nocompatible
"%コマンドを拡張するプラグイン
runtime macros/matchit.vim

"termdebugの設定
packadd termdebug
let g:termdebug_wide = 160

"rustでのformat
let g:rustfmt_autosave = 1


"今いる行をハイライト
set cursorline

"クリップボード有効化
"set clipboard&
set clipboard=unnamedplus

" UltiSnips スニペット展開
let g:UltiSnipsExpandTrigger='<c-k>'
" UltiSnips スニペット次の位置に移動
let g:UltiSnipsJumpForwardTrigger='<c-j>'
" UltiSnips スニペット前の位置に移動
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

"自作スニペット
let g:UltiSnipsSnippetsDirectories = "snippets/UltiSnips/"
set runtimepath+=~/.vim/snippets

" Ctrl+c as Esc
nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
snoremap <C-c> <Esc>
xnoremap <C-c> <Esc>
cnoremap <C-c> <Esc>
onoremap <C-c> <Esc>
lnoremap <C-c> <Esc>
tnoremap <C-c> <Esc>

" Keyboard shortcuts
" nnoremap ; :

" Quick save
nmap <leader>w :w<CR>

" clang-format コーディングスタイル
"let g:clang_format#code_style = 'llvm'

let g:clang_format#style_options = {
\   "AlignConsecutiveAssignments": "true",
\   "Cpp11BracedListStyle": "true",
\   "DerivePointerAlignment": "false",
\   "IndentCaseLabels": "true",
\   "IndentWidth":     4,
\   "KeepEmptyLinesAtTheStartOfBlocks": "true",
\   "PointerAlignment": "Right",
\   "SpacesBeforeTrailingComments": 1,
\   "Standard":        "Cpp11",
\   "TabWidth":        4,
\   "UseTab":          "Always" }

" clang-formatで自動整形
"autocmd FileType c ClangFormatAutoEnable
"autocmd FileType cpp ClangFormatAutoEnable

" set clang options for vim-clang
"let g:clang_c_options = '-std=c11'

"texファイルのfiletypeをlatexにする
let g:tex_flavor = "latex"

"insert mode における左右への移動
inoremap <C-b> <Left>
inoremap <C-f> <Right>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

"vim起動時にNERDTreeを自動実行
"autocmd vimenter * NERDTree

" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定
set ambiwidth=double
" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu

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

"vimgrepの使用時に自動的にquickfix-windowを開くようにする
autocmd QuickFixCmdPost *grep* cwindow

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
" コメントの色を水色
hi Comment ctermfg=3
" 入力モードでTabキー押下時に半角スペースを挿入
"set expandtab
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
set guioptions+=R
" 対応する括弧を強調表示
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
"改行時に，ブロックに応じて自動でインデントを挿入する
"set autoindent
"改行時に，ブロックに応じて自動でインデントを挿入しない
"set noautoindent
"set nosmartindent
"set nocindent
" スワップファイルを作成しない
set noswapfile
" 検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
" タイトルを表示
set title
" 行番号の表示
set number
" ヤンクでクリップボードにコピー
"set clipboard=unnamed,autoselect
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" シンタックスハイライト
syntax on
" すべての数を10進数として扱う
set nrformats=
" バッファスクロール
set mouse=a
"自動改行をOFFに設定
set formatoptions=q

"カーソルの形を変更
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif
set visualbell t_vb=
