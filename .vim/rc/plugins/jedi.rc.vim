" jedi

"let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0

"neocompleteを使用しないのでコメントアウトして<C-Space>に割り当て
"let g:jedi#completions_enabled = 0
let g:jedi#completions_command = "<C-j>"

"let g:jedi#popup_select_first = 0
let g:jedi#rename_command = "<Leader>R"
let g:jedi#goto_assignments_command = "<Leader>G"

autocmd FileType python setlocal completeopt-=preview

autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType python3 setlocal omnifunc=jedi#completions
autocmd FileType htmldjango setlocal omnifunc=jedi#completions

