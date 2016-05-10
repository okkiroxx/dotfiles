if &compatible
    set nocompatible
endif

" release autogroup in MyAutoCmd
augroup MyAutoCmd
    autocmd!
augroup END

" Python補完用 "{{{

if has('mac')
    let $PATH = "~/.pyenv/shims:".$PATH
endif


"}}}

"---------- プラグイン "{{{

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimがなければgithubから落としてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    "execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
    let &runtimepath = s:dein_repo_dir .",". &runtimepath
endif

" 設定開始
if dein#load_state(s:dein_dir)
    " プラグインリストを収めたTOMLファイル
    let s:toml      = '~/.vim/rc/dein.toml'
    let s:lazy_toml = '~/.vim/rc/dein_lazy.toml'

    call dein#begin(s:dein_dir, [$MYVIMRC, s:toml, s:lazy_toml])

    " TOMLを読込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" もし、未インストールのものがあればインストール
if has('vim_starting') && dein#check_install()
    call dein#install()
endif

filetype plugin indent on

"}}}

"---------- キーマッピング "{{{
"Unite
nnoremap [unite] <Nop>
nmap U [unite]
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]r :<C-u>Unite register<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
nnoremap <silent> [unite]t :<C-u>Unite tab<CR>
nnoremap <silent> [unite]w :<C-w>Unite window<CR>

"<C-\>でVimFilerを左側に固定起動
noremap <C-\> :VimFilerExplorer<CR>

"折り返し行でも普通に移動出来るように
nnoremap j gj
nnoremap k gk

"ESCを2回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :noh<CR>

"タグジャンプ
"定義元が複数ある場合対策
nnoremap <C-]> :exe("tjump ".expand('<cword>'))<CR>
"vspして定義元へ飛ぶ
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>

"\rでquickrunを起動
noremap <Leader>r :QuickRun<CR>

"\tでTagberを起動
noremap <Leader>t :TagbarToggle<CR>

"\gでGundoToggle
noremap <Leader>g :GundoToggle<CR>

"Evervim
nnoremap <silent> ,el :<C-u>EvervimNotebookList<CR>
nnoremap <silent> ,en :<C-u>EvervimCreateNote<CR>
nnoremap <silent> ,es :<C-u>EvervimSearchByQuery<SPACE>
nnoremap <silent> ,eb :<C-u>EvervimOpenBrowser<CR>
"}}}

"---------- その他 "{{{
set fenc=utf-8
set title
set number
set ruler
set showcmd
set laststatus=2
set list
set listchars=tab:▸\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set cursorline
set cursorcolumn
set colorcolumn=80
set foldcolumn=4
set showtabline=2
"set foldmethod=marker

set ignorecase
set smartcase
set incsearch
set hlsearch

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab

set nowrap
set backspace=indent,eol,start
set scrolloff=4
set sidescrolloff=16
set sidescroll=1
"set splitbelow

set hidden
set confirm
set switchbuf=useopen
set undodir=~/.vim/undo
set backupdir=~/.vim/backup
"set directory=~/.vim/tmp
set undofile

set virtualedit=block
set mouse=a
"jediがinitエラーになるのでコメントアウト
"set shellslash
set history=1000

set ambiwidth=

"タグファイルは1個上のディレクトリも読む
set tags=../tags,./tags,tags

"autochdirがVimFilerとバッティングしたので、autocmdで
autocmd BufEnter *  execute ":lcd " . expand("%:p:h")
"全角スペースの可視化
autocmd VimEnter,WinEnter * let w:m_tbs = matchadd("Error", '　')


syntax enable


"OS毎のファイルフォーマットを指定 "{{{
if has('win32')
    set fileformats=dos,unix
elseif has('unix')
    set fileformats=unix,dos
    set fileencodings=utf-8,cp932,sjis,euc-jp,latin1
elseif has('mac')
    set fileformats=mac,dos
endif
"}}}

"CUI用のcolorscheme "{{{
if has('win32')
    colorscheme pablo
else
    colorscheme railscasts
    autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
endif
"}}}
"

"}}}

