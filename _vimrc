""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" インデントの可視化
NeoBundle 'Yggdroot/indentLine'
" 閉じ括弧の自動補完
NeoBundle 'cohama/lexima.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""

"------------------------------------------------------------------
" 検索の挙動に関する設定:

" インクリメンタルサーチ設定
set incsearch
" 検索結果のハイライト表示
set hlsearch

"------------------------------------------------------------------
" 編集に関する設定:

" 自動インデントするときの挿入するタブの幅
set shiftwidth=4
" タブ入力するときの挿入するタブの幅 0==tabstop, !0=softtabstop
set softtabstop=4
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set expandtab
" インデント設定  autoindent,smartindent,cindent
set autoindent
" swapファイル設定
set noswapfile
"バックアップの設定
set nobackup

"------------------------------------------------------------------
" 文字コード設定

" 内部文字コード
set encoding=utf-8
" 書き込み文字コード
set fileencoding=utf-8
" 読み込み文字コード
set fileencodings=utf-8,euc-jp,cp932,iso-2022-jp
" 改行コード
set fileformats=unix,dos,mac

"------------------------------------------------------------------
" GUI固有ではない画面表示の設定

" 行番号を表示 (unnumber:非表示)
set number
" カーソル行に下線
set cursorline
" タブと行末の空白を可視化 test→
set listchars=tab:^_,trail:~
" タブや改行を表示
set list
" 入力中のコマンドを表示
set showcmd
" 長い一行をきちんと表示
set display=lastline
" 補完メニューの高さ
set pumheight=10
" ビープ音の設定
set visualbell t_vb=

"------------------------------------------------------------------
"ステータスライン関係

"ステータスラインを常に表示 0:nerver 1:if there two window
set laststatus=2
" ステータスライン表示内容 文字コード,改行,ファイル名
set statusline=[%{&fileencoding}][\%{&fileformat}]\ %F%m%r%=<%c:%l>

"------------------------------------------------------------------
"netrw（ファイルブラウザ）関係

"表示の初期設定（3:tree view）
let g:netrw_liststyle = 3

"------------------------------------------------------------------
"クリップボード設定
"set clipboard=unnamed

"------------------------------------------------------------------
" キーマッピング設定

" C-jをESCにする
imap <C-j> <esc>

"------------------------------------------------------------------
" 全角スペース可視化
scriptencoding utf-8
augroup highlightIdegraphicSpace
    autocmd!
    autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
colorscheme  default

