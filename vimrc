" Information 
" {{{
" vim:foldmarker={{{,}}} tw=80 ft=vim
" Last Modified [ 2016-01-01 ]
"
" This file just sources my configuration files. 
"
" }}}
"

" Set the runtime path to the current script directory
" See also https://stackoverflow.com/a/3384476

" set default 'runtimepath' (without ~/.vim folders)
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" what is the name of the directory ctaining this file?
let s:portable = expand('<sfile>:p:h')

" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)


exec 'source ' . s:portable . '/vimsettings'
exec 'source ' . s:portable . '/vimmisc'
exec 'source ' . s:portable . '/vimautocmd'
exec 'source ' . s:portable . '/vimfunctions'
exec 'source ' . s:portable . '/vimabbreviation'
exec "source " . s:portable . '/vimbindings'
