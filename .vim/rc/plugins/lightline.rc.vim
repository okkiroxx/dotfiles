" lightline

" コピペ用
" Windows ⭠ ⭤ ⮀ ⮁ ⮂ ⮃
" unix         

let g:lightline = {
    \ 'colorscheme': 'landscape',
    \ 'active': {
    \   'left': [
    \       [ 'mode', 'paste' ],
    \       [ 'fugitive', 'virtualenv', 'pyenv', 'filename' ],
    \       ]
    \   },
    \ 'component_function': {
    \   'modified': 'LightLineModified',
    \   'readonly': 'LightLineReadonly',
    \   'fugitive': 'LightLineFugitive',
    \   'filename': 'LightLineFilename',
    \   'fileformat': 'LightLineFileformat',
    \   'filetype': 'LightLineFiletype',
    \   'fileencoding': 'LightLineFileencoding',
    \   'mode': 'LightLineMode',
    \   'virtualenv': 'virtualenv#statusline',
    \   'pyenv': 'LightLinePyenv',
    \   },
    \ }

"if has('gui_running') && has('win32')
"    let g:lightline['separator'] = {'left': "⮀", 'right': "⮂"}
"    let g:lightline['subseparator'] = {'left': "⮁", 'right': "⮃"}
"    let s:readonly_str = '⭤'
"    let s:fugitive_str = '⭠ '
"elseif has('unix')
"    let g:lightline['separator'] = {'left': "", 'right': ""}
"    let g:lightline['subseparator'] = {'left': "", 'right': ""}
"    let s:readonly_str = ''
"    let s:fugitive_str = ' '
"else
"    let s:readonly_str = ''
"    let s:fugitive_str = ''
"endif

let g:lightline['separator'] = {'left': "", 'right': ""}
let g:lightline['subseparator'] = {'left': "", 'right': ""}
let s:readonly_str = ''
let s:fugitive_str = ' '

function! LightLineModified()
    return &ft =~ 'help\|nerdtree\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &ft !~? 'help\|nerdtree\|vimfiler\|gundo' && &readonly ? s:readonly_str : ''
endfunction

function! LightLineFilename()
      let fname = expand('%:t')
        return fname == '__Tagbar__' ? fname :
              \ fname =~ '__Gundo\|NERD_tree' ? '' :
              \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
              \ &ft == 'unite' ? unite#get_status_string() :
              \ &ft == 'vimshell' ? vimshell#get_status_string() :
              \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
              \ ('' != fname ? fname : '[No Name]') .
              \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
    if &ft !~? 'nerdtree\|vimfiler\|gundo' && exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? s:fugitive_str._ : ''
    endif
    return ''
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
      let fname = expand('%:t')
        return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == '__Gundo__' ? 'Gundo' :
                \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
                \ &ft == 'unite' ? 'Unite' :
                \ &ft == 'nerdtree' ? 'NERDTree' :
                \ &ft == 'vimshell' ? 'VimShell' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLinePyenv()
    if ! ( has('win32') || has('win32unix') )
        return &ft == 'python' ? pyenv#info#format('⌘%av') : ""
    else
        return ""
    endif
endfunction
