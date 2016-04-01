" unite

let g:unite_enable_start_insert = 0

call unite#custom#default_action("source/bookmark/directory", "vimfiler")
call unite#custom#default_action("directory", "vimfiler")
call unite#custom#default_action("directory_mru", "vimfiler")

autocmd MyAutoCmd FileType unite call s:unite_settings()

function! s:unite_settings()
    imap <buffer> <Esc><Esc> <Plug>(unite_exit)
    nmap <buffer> <Esc> <Plug>(unite_exit)
    nmap <buffer> <C-n> <Plug>(unite_select_next_line)
    nmap <buffer> <C-p> <Plug>(unite_select_previous_line)
endfunction

