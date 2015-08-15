"---------------------------------------------------------------------------
" 検索の挙動に関する設定:

" インクリメンタルサーチ設定
set incsearch
 "検索時に大文字小文字を無視 (noignorecase:無視しない)
 set noignorecase
 " 大文字小文字の両方が含まれている場合は大文字小文字を区別
 set smartcase

 "---------------------------------------------------------------------------
 " 編集に関する設定:
 "
 " インデントするときの挿入するタブの幅
 set shiftwidth=4
 " KB入力するときの挿入するタブの幅 0==tabstop, !0=softtabstop
 set softtabstop=4
 " タブの画面上での幅
 set tabstop=4
 " タブをスペースに展開しない (expandtab:展開する)
 set expandtab
 " インデント設定  autoindent,smartindent,cindent
 set autoindent
 " cindent時の詳細設定 cinoptions-values参照
 "set cinoptions=
 " バックスペースキー動作設定
 "set backspace=indent,eol,start

 "---------------------------------------------------------------------------
 " 文字コード設定
 set encoding=utf-8
 "set fileencodings=cp932,utf-8,eucjp
 set fileencodings=utf-8,eucjp,cp932
 set fileformats=unix,dos
 set hlg=ja

 "---------------------------------------------------------------------------
 " GUI固有ではない画面表示の設定:
 "
 " 行番号を非表示 (number:表示)
 set number
 " ルーラーを表示 (noruler:非表示)
 set noruler
 " ソースコード折りたたみ機能を有効にする
 " 設定数種類  manual,indent,expr,syntax,diff,marker
 " zo:開く  zc:閉じる  zO,zC:再帰的に
 "set foldmethod=syntax
 " カーソル上下行数 999なら常に中央
 "set scrolloff=999
 " カーソル行に下線
 set cursorline

 "---------------------------------------------------------------------------
 " 色設定
 " 8     SpecialKey      スペシャルキー、^@など表示できない文字
 " @     NonText EOF以降の~など
 " d     Directory       CTRL-Dで表示したディレクトリ
 " e     ErrorMsg        エラーメッセージ
 " f     Folded  折り畳まれた行
 " F     FoldColumn      フォールドコラム
 " i     IncSearch       インクリメンタルサーチの結果
 " l     Search  最後の検索結果
 " m     MoreMsg -- 継続 -- のようなMoreメッセージ
 " M     ModeMsg -- 挿入 -- などのモードメッセージ
 " n     LineNr  行番号
 " r     Question        hit-enterやyes/noなどの質問
 " s     StatusLine      ステータスライン
 " S     StatusLineNC    アクティブではないウィンドウのステータスライン
 " t     Title   :set allや:autocmdなどで表示される「--- オプション ---」のような文字
  " c     VertSplit       縦方向へのスプリットの境界
  " v     Visual  ビジュアルモードの選択範囲
  " V     VisualNOSビジュアルモードの選択範囲(Vimがアクティブではないとき)
  " w     WarningMsg      警告メッセージ
  " W     WildMenu        ワイルドメニュー
  " たとえば、set highlight=n:ErrorMsgとすると、行番号がErrorMsgで指定した色に設定される。
  "

  " 全角スペース可視化
  scriptencoding utf-8
  augroup highlightIdegraphicSpace
    autocmd!
      autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
        autocmd VimEnter,WinEnter * match IdeographicSpace /　/
        augroup END
        colorscheme  default

        " タブと行末の空白を可視化 test→
        set listchars=tab:^_,trail:~
        " タブや改行を表示
        set list
        "highlight SpecialKey cterm=underline ctermbg=white ctermfg=blue
        highlight SpecialKey cterm=underline ctermbg=gray ctermfg=gray

        "------------------------------------
        " .pcファイルをファイルタイプ.esqlcとして開く
        au BufRead,BufNewFile *.pc     setfiletype esqlc
        " 下記の設定は~/.vim/syntax/にdownloadしたproc.vimをcpすること
        "au! BufRead,BufNewFile *.pc     setfiletype proc

        "---------------------------------------------------------------------------
        "ステータスライン関係
        "ステータスラインを常に表示 0:nerver 1:if there two window
        set laststatus=2
        " ステータスライン表示内容 文字コード,改行,ファイル名
        set statusline=[%{&fileencoding}][\%{&fileformat}]\ %F%m%r%=<%c:%l>

        "---------------------------------------------------------------------------
        " GNU Globalの設定
        "Ctrl+t :Gtags と入力する
        "Ctrl+h :カーソル下文字列でcurrentのソースコードの grep
        "Ctrl+i 開いているファイルに定義されている関数の一覧を表示
        "Ctrl+j カーソル位置の関数へジャンプ
        "Ctrl+n 次の検索結果へジャンプする
        "Ctrl+p 前の検索結果へジャンプする
        map <C-t> :Gtags
        map <C-h> :Gtags -gl<CR>
        map <C-i> :Gtags -f %<CR>
        map <C-j> :GtagsCursor<CR>
        map <C-n> :cn<CR>
        map <C-p> :cp<CR>
        ":Gtags 関数名        | 関数名 → ソースコード（定義）
        ":Gtags -r 関数名         | 関数名 → ソースコード（参照）
        ":Gtags -f ファイル名 | ソースコード → 関数一覧
        "global -c 関数名一部 | 関数名の一部 → 関数一覧
        ":Gtags -g 検索文字列 | ソースコードの grep
	imap <C-j> <esc>