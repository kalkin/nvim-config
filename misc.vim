" vim: fmr={{{,}}} fdm=marker tw=80 ft=vim
"
" Information {{{
" This file contains all configurations which doesn't fit elsewhere
" }}}

" Syntax on!
syntax on

" Filetype plugin on!
filetype plugin on

set termguicolors
colorscheme NeoSolarized

let g:mapleader=' '

" Needed for loading own snippets and not the snipmate snippets
let g:snippets_dir='~/.vim/snippets'

" vim-orgmode
let g:org_agenda_files = ['~/Documents/*.org']
let g:org_todo_keywards = [ 'TODO(t)', '|', 'DONE(d/!)', 'CANCEL(c@)' ]

" Ale configration
" Ale open location list if there're errors
let g:ale_open_list = 1

" The rpmlint linter is disabled by default, because running rpmlint can result
" in the execution of code embedded in the spec file and rpmlint makes no
" distinction between checks which are safe to run on untrusted files and those
" which are not.
" Let's enable it for my and QubesOS specfiles
augroup SafeSpecFiles
    autocmd BufRead */qubes-src/**/*.spec " Allow QubesOS specfiles
        \ let b:ale_linters = {'spec': ['rpmlint']}
    autocmd BufRead ~/Projects/**/*.spec " Allow my specfiles
        \ let b:ale_linters = {'spec': ['rpmlint']}
    autocmd BufNew *.spec let b:ale_linters = {'specs': ['rpmlint]}
augroup END


set foldtext=NeatFoldText()

let g:undotree_SplitWidth = 40
let g:undotree_SetFocusWhenToggle = 1

augroup HiglightTODO
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(WORKAROUND\|CHANGED\|XXX\|FIXME\|BUG:\|HACK\)')
augroup END

" Set airline theme
> let g:airline_theme='dark'
