" neocomplete

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#force_omi_input_patterns = {}
let g:neocomplete#force_omi_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

"inoremap <expr><C-g>    neocomplete#undo_dompletion()
"inoremap <expr><C-l>    neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y> neocomplete#close_popup()
"inoremap <expr><C-e> neocomplete#cancel_popup()
"spaceキーではすぐにスペースを打ちたいのでコメントアウト
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

