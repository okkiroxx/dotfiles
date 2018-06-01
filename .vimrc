if &compatible
    set nocompatible
endif


"}}}

"---------- プラグイン "{{{

if has('vim_starting')
    set rtp+=~/.vim/plugged/vim-plug
    if !isdirectory(expand('~/.vim/plugged/vim-plug'))
        echo 'install vim-plug...'
        call system('mkdir -p ~/.vim/plugged/vim-plug')
        if has('win32')
            call system('git clone https://github.com/junegunn/vim-plug.git %homepath%/.vim/plugged/vim-plug/autoload')
        else
            call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
        endif
    end
endif

call plug#begin('~/.vim/plugged')
    Plug 'junegunn/vim-plug',
        \ {'dir': '~/.vim/plugged/vim-plug/autoload'}

    if ! ( has('kaoriya') || has('job') )
        if has('win32unix')
            Plug 'Shougo/vimproc.vim', { 'do': 'make -f make_cygwin.mak' }
        else
            Plug 'Shougo/vimproc.vim', { 'do': 'make' }
        endif
    endif

    Plug 'itchyny/lightline.vim'
    source ~/.vim/rc/plugins/lightline.rc.vim

    Plug 'nathanaelkane/vim-indent-guides'
    source ~/.vim/rc/plugins/indent_guides.rc.vim

    Plug 'bronson/vim-trailing-whitespace'

    Plug 'lilydjwg/colorizer'

    Plug 'jpo/vim-railscasts-theme'

    Plug 'tpope/vim-fugitive'

    Plug 'thinca/vim-quickrun', { 'on': ['QuickRun'] }
    autocmd! User vim-quickrun source ~/.vim/rc/plugins/quickrun.rc.vim

    Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle'] }


    let b:pythonFiletype = ['python', 'python3', 'htmldjango']

    if has('win32') || has('win32unix')
        Plug 'plytophogy/vim-virtualenv', { 'for': b:pythonFiletype }
            \ | Plug 'davidhalter/jedi-vim', { 'do': 'pip install jedi', 'for': b:pythonFiletype }
        autocmd! User jedi-vim source ~/.vim/rc/plugins/jedi.rc.vim
    else
        Plug 'lambdalisue/vim-pyenv', { 'for': b:pythonFiletype }
            \ | Plug 'davidhalter/jedi-vim', { 'do': 'pip install jedi', 'for': b:pythonFiletype }
        autocmd! User vim-pyenv source ~/.vim/rc/plugins/vim-pyenv.rc.vim
        autocmd! User jedi-vim source ~/.vim/rc/plugins/jedi.rc.vim
    endif

    if ! ( has('win32') || has('win32unix') || has('mac') )
        Plug 'lambdalisue/vim-django-support', { 'for': b:pythonFiletype }
    endif

    unlet b:pythonFiletype


    Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }

    Plug 'tpope/vim-markdown', { 'for': 'markdown' }

    Plug 'kakkyz81/evervim', {
        \ 'on': [ 'EvervimCreateNote', 'EvervimOpenBrowser', 'EvervimNotebookList', 'EvervimSearchByQuery'] }
    source ~/.vim/evervim.rc.vim

    if has('gui_running')
        Plug 'tyru/open-browser.vim'
        Plug 'kannokanno/previm'
    endif

    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()

filetype plugin indent on

"}}}

"---------- キーマッピング "{{{

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

"ctrl+\でNERDTreeを起動
nnoremap <silent><C-\> :NERDTreeToggle<CR>

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
set termguicolors

set ignorecase
set smartcase
set incsearch
set hlsearch

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab

set wrap
set breakindent
set backspace=indent,eol,start
set scrolloff=3
set sidescrolloff=16
set sidescroll=1
set splitbelow
set splitright

set hidden
set confirm
set switchbuf=useopen
set undodir=~/.vim/undo
set backupdir=~/.vim/backup
"set directory=~/.vim/tmp
set undofile
set backup

set virtualedit=block
set mouse=a
"jediがinitエラーになるのでコメントアウト
"set shellslash
set history=1000
set clipboard=unnamed,autoselect

"set ambiwidth=

"タグファイルは1個上のディレクトリも読む
set tags=../tags,./tags,tags

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

colorscheme railscasts
autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
"

"}}}
