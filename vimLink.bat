mklink %HOMEPATH%\_vimrc %HOMEPATH%\dotfiles\.vimrc
mklink %HOMEPATH%\_gvimrc %HOMEPATH%\dotfiles\.gvimrc
mklink /D %HOMEPATH%\.vim\rc %HOMEPATH%\dotfiles\.vim\rc
mklink /D %HOMEPATH%\vimfiles\syntax %HOMEPATH%\dotfiles\.vim\syntax

copy /Y %HOMEPATH%\Dropbox\vim\evervim.rc.vim %HOMEPATH%\.vim\evervim.rc.vim

