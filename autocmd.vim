" Information 
" {{{
" vim:foldmarker={{{,}}} tw=80 ft=vim 
" Last Modified [ 2010-09-16 ]
"
" This file contains all Automatic commands (|autocommand|)
" An autocommand is a command that is executed automatically in response to some
" event, such as a file being read or written or a buffer change. 
"
" }}}

" save and reload the folds see also :help 'views-sessions
augroup vimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END

au vimrc BufWinLeave *.* mkview
au vimrc BufWinEnter *.* silent! loadview

au vimrc VimResized * wincmd = " Autoresize windows on terminal size changes
au vimrc BufWritePost * Neomake


" Let's be friendly :)
au vimrc VimEnter * echo "Welcome back kalkin :)"
au vimrc VimLeave * echo "Cya in Hell."

" Perl6 rulez!
au vimrc BufNewFile,BufRead *.p6 setf perl6

" Set dictionary to syntax file
au vimrc FileType * exec('set  dict+='.$VIMRUNTIME.'/syntax/'.getbufvar("%","current_syntax").'.vim')

