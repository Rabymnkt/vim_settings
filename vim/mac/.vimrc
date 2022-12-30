call plug#begin('~/.config/vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-endwise'
Plug 'w0ng/vim-hybrid'
Plug 'osyo-manga/vim-anzu'
Plug 'EdenEast/nightfox.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'

Plug 'dense-analysis/ale'

Plug 'sainnhe/gruvbox-material'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'yuki-yano/fern-preview.vim'

" fuzzy
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

"------------------------------------------------------------------------------------------------
" ***********************************************************************************
" colorscheme の設定前に全角スペースの強調表示の設定をしないとエラーが出る．
" 全角スペースの背景を赤に変更
autocmd Colorscheme * highlight FullWidthSpace guibg=darkcyan
autocmd VimEnter * match FullWidthSpace /　/

" カラースキーム系の設定
"
" set notermguicolors
" set background=dark
" colorscheme duskfox

if has('termguicolors')
  set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
let g:airline_theme = 'gruvbox_material'
" ***********************************************************************************

" leader キーの変更
let mapleader = "\<Space>"

" -----------------------------------------------------------------------------------
" fzf.vimの設定
" git管理されていれば:GFiles、そうでなければ:Filesを実行する
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GFiles
  endif
endfun
nnoremap <silent> <leader>ff :call FzfOmniFiles()<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>fr :Rg<CR>
" <leader>fk で文字列検索を開く
" <S-?>でプレビューを表示/非表示する
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
\ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
\ <bang>0)
nnoremap <silent> <leader>fk :Rg<CR>

" frでカーソル位置の単語をファイル検索する
nnoremap <silent> <leader>fs vawy:Rg <C-R>"<CR>
" frで選択した単語をファイル検索する
xnoremap <silent> <leader>fs y:Rg <C-R>"<CR>
" -----------------------------------------------------------------------------------

" ultisnips の設定
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
" fugitiveの設定
nnoremap <silent> <leader>ds :Gdiffsplit<CR>

" git 操作(gitgutter)
"" git操作
" g]で前の変更箇所へ移動する
nnoremap <silent> <leader>gp :GitGutterPrevHunk<CR>
" g[で次の変更箇所へ移動する
nnoremap <silent> <leader>gn :GitGutterNextHunk<CR>
" ghでdiffをハイライトする
nnoremap <silent> <leader>gh :GitGutterLineHighlightsToggle<CR>
" gpでカーソル行のdiffを表示する
nnoremap <silent> <leader>gd :GitGutterPreviewHunk<CR>
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
" 記号の色を変更する
" highlight GitGutterAdd ctermfg=green
" highlight GitGutterChange ctermfg=blue
" highlight GitGutterDelete ctermfg=red

highlight GitGutterAdd guifg=green
highlight GitGutterChange guifg=blue
highlight GitGutterDelete guifg=red

"" 反映時間を短くする(デフォルトは4000ms)
set updatetime=250

" airlineの設定
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 1
let g:airline#extensions#default#layout = [[ 'a', 'b', 'c' ], ['x', 'y']]
let g:airline_section_c = '%t %M'
" タブラインの表示を変更する
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_close_button = 0
" let g:airline_theme = 'deus'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '>'

" vim-anzuの設定
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Fern の設定
" Ctrl+dでファイルツリーを表示/非表示する
nnoremap <silent> <C-d> :Fern . -reveal=% -drawer -stay -toggle -width=25<CR>
" アイコンの表示を有効化
let g:fern#renderer = 'nerdfont'
" アイコンに色をつける
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
" 隠しファイルも表示
let g:fern#default_hidden=1
" 公式リポジトリを参考にキーマップを追加
function! s:fern_settings() abort
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END

let g:fern#renderer#nerdfont#indent_markers = 1

" バッファ移動のショートカットキー設定
set hidden
nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-h> :bprev<CR>

" ターミナルモードから抜けるためのキーバインド
tnoremap <silent> <ESC> <C-\><C-n>

"vimgrepの使用時に自動的にquickfix-windowを開くようにする
autocmd QuickFixCmdPost *grep* cwindow

" ale
" let g:ale_lint_on_text_changed = 0
" シンボルカラムを表示したままにする
let g:ale_sign_column_always = 1
" 保存時に整形してくれる
let g:ale_fix_on_save = 1
" 補完してくれる
let g:ale_completion_enabled = 1
" エラー行に表示するマーク
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
" エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_linters = {
    \   'c' : ['clangd'],
    \   'cpp' : ['clangd']
\}
" --------------------------------------------------------------------------------------
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
" undoファイル(.un~)を生成しない
set noundofile
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定(neovimでは有効にすると画面がおかしくなった)
"set ambiwidth=double
" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu
" コマンドラインでTAB補完時に大文字・小文字を区別しない
set wildignorecase
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
" 文字列検索のハイライトオフ
nmap <slient> <Esc><Esc> :<C-u>nohlsearch<CR><Esc>
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
set smartindent
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
" Vim内部で使われる文字エンコーディングをutf-8にする

" python2 providerを無効化
" let g:loaded_python_provider = 0
" let g:python_host_prog = '/usr/bin/python'
" let g:python3_host_prog = '/usr/bin/python3'
hi Comment ctermfg=gray

if has('mouse')
  set mouse=a
endif
