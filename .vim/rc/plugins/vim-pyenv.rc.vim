" vim-pyenv

if jedi#init_python()
    function! s:jedi_auto_force_py_version() abort
        let major_version = pyenv#python#get_internal_major_version()
        if major_version == 2
            let $PYTHONHOME = s:python2home
        elseif major_version == 3
            let $PYTHONHOME = s:python3home
        call jedi#force_py_version(major_version)
    endfunction
    augroup vim-pyenv-custom-augroup
        autocmd! *
        autocmd User vim-pyenv-activate-post    call s:jedi_auto_force_py_version()
        autocmd User vim-pyenv-deactivate-post  call s:jedi_auto_force_py_version()
    augroup END
endif

