
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

    Plug 'itchyny/lightline.vim'
    source ~/.vim/rc/plugins/lightline.rc.vim

    Plug 'Yggdroot/indentLine'

    Plug 'bronson/vim-trailing-whitespace'

    Plug 'lilydjwg/colorizer'

    Plug 'jpo/vim-railscasts-theme'
    Plug 'joshdick/onedark.vim'
    Plug 'tomasr/molokai'
    Plug 'crusoexia/vim-monokai'

    "Plug 'crusoexia/vim-javascript-lib'
    "Plug 'pangloss/vim-javascript'

    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    "let g:gitgutter_highlight_lines = 1

    Plug 'thinca/vim-quickrun', { 'on': ['QuickRun'] }
    autocmd! User vim-quickrun source ~/.vim/rc/plugins/quickrun.rc.vim

    Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle'] }

    Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
    let g:gundo_prefer_python3 = 1

    Plug 'preservim/vim-markdown', { 'for': 'markdown' }
    let g:vim_markdown_folding_disabled = 1

    Plug 'bullets-vim/bullets.vim', { 'for': 'markdown' }
    let g:bullets_pad_right = 0
    let g:bullets_outline_levels = []

    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
    Plug 'ryanoasis/vim-devicons'

    Plug 'cohama/lexima.vim'

    Plug 'alvan/vim-closetag'

    Plug 'elzr/vim-json'
    let g:vim_json_syntax_conceal = 0


    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'mattn/vim-lsp-icons'

    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'

    source ~/.vim/rc/plugins/lsp.rc.vim


    Plug 'lambdalisue/vim-pyenv'

    Plug 'tyru/open-browser.vim'
    Plug 'kannokanno/previm'

    Plug 'vim-jp/vimdoc-ja'

    Plug 'okkiroxx/rtx.vim'

call plug#end()

filetype plugin indent on

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

set ignorecase
set smartcase
set incsearch
set hlsearch

set autoindent
set smartindent
"set cindent
set smarttab
set expandtab

set shiftwidth=4
set softtabstop=0
set tabstop=4

if has("autocmd")
    autocmd FileType js         setlocal sw=2 sts=0 ts=2 et
    autocmd FileType javascript setlocal sw=2 sts=0 ts=2 et
    autocmd FileType html       setlocal sw=2 sts=0 ts=2 et
    autocmd FileType python     setlocal sw=4 sts=0 ts=4 et
endif

set nowrap
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
set directory=~/.vim/swp
set undofile
set backup

set virtualedit=block
set mouse=a
set history=1000
set clipboard=unnamed,autoselect
set tags=../tags,./tags,tags

set helplang=ja
set ambiwidth=double

if exists('&termguicolors')
    if !has('unix')
        set termguicolors
    endif
endif

if exists('&completeslash')
    set completeslash=slash
endif

set completeopt=menuone,noinsert

"補完表示時のEnterで改行をしない
inoremap <expr><CR> pumvisible() ? "<C-y>" : "<CR>"
"補完表示時TABで決定
inoremap <expr><TAB> pumvisible() ? "<C-y>" : "<TAB>"


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

"os毎のファイルフォーマットを指定
if has('win32') || has('win64')
    set fileformats=dos,unix
elseif has('mac')
    set fileformats=unix,dos,mac
elseif has('unix')
    set fileformats=unix,dos
    set fileencodings=utf-8,cp932,sjis,euc-jp,latin1
endif

autocmd vimenter,colorscheme * highlight normal ctermbg=none

"全角スペースの可視化
autocmd vimenter,winenter * let w:m_tbs = matchadd("error", '　')


colorscheme railscasts
syntax enable

let g:webdevicons_enable_nerdtree = 1


if has('vim_starting')
    " 挿入モード時に点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[5 q"
    " ノーマルモード時に点滅のブロックタイプのカーソル
    let &t_EI .= "\e[1 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

"挿入モードを抜けるときにIMEをOFF(MacはKarabinerで)
autocmd InsertLeave * call IM_off()

function! IM_off()
    if has('unix')
        call system('fcitx5-remote -c')
    elseif has('win32') || has('win64')
        call system('%HOMEPATH%\zenhan.exe 0')
    endif
endfunction

