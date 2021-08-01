" Ale configuration
" Ale open location list if there're errors
let g:ale_open_list = 1
let g:ale_pattern_options = {
\   '.*/.local/lib.*/.*': {'ale_enabled': 0},
\   '/usr/.*': {'ale_enabled': 0},
\   'vendor/.*': {'ale_enabled': 0},
\}

let g:ale_completion_enabled = 1

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
    autocmd BufNew *.spec let b:ale_linters = {'spec': ['rpmlint']}
augroup END

" Autoclose ale location list on closing the buffer
augroup CloseLoclistWindowGroup " see :help g:ale_open_list
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END
