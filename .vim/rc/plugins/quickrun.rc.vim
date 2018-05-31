" quickrun

nnoremap <Leader>q :<C-u>bw! quickrun<CR>

let g:quickrun_config = get(g:, 'quickrun_config', {})

if has('job')
    let g:quickrun_config._ = {
          \ 'runner' : 'job',
          \ }
else
    let g:quickrun_config._ = {
          \ 'runner' : 'vimproc',
          \ }
endif


if has('win32')
    let g:quickrun_config['python'] = {
          \ "hook/output_encode/enable" : 1,
          \ "hook/output_encode/encoding" : "cp932",
          \ }
endif
