" lightline

" コピペ用シンボル
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

if has('gui_running') && has('win32')
    let g:lightline['separator'] = {'left': "⮀", 'right': "⮂"}
    let g:lightline['subseparator'] = {'left': "⮁", 'right': "⮃"}
elseif has('unix')
    let g:lightline['separator'] = {'left': "", 'right': ""}
    let g:lightline['subseparator'] = {'left': "", 'right': ""}
endif

function! LightLineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    if has('gui_running') && has('win32')
        return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
    elseif has('unix')
        return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
    endif
endfunction

function! LightLineFilename()
      let fname = expand('%:t')
        return fname == '__Tagbar__' ? fname :
              \ fname =~ '__Gundo__' ? '' :
              \ &ft == 'nerdtree' ? 'NERDTree' :
              \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
              \ &ft == 'unite' ? unite#get_status_string() :
              \ &ft == 'vimshell' ? vimshell#get_status_string() :
              \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
              \ ('' != fname ? fname : '[No Name]') .
              \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
    if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
        let _ = fugitive#head()
        if has('gui_running') && has('win32')
            return strlen(_) ? '⭠ '._ : ''
        elseif has('unix')
            return strlen(_) ? ' '._ : ''
        endif
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
                \ &ft == 'nerdtree' ? '' :
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
