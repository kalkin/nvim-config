let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ }

setlocal omnifunc=LanguageClient#complete
let b:rust_linters = ['rls']

map <buffer> <C-]> <Plug>(lcn-definition)
map <buffer> <C-w>] :vsplit<CR> <Plug>(lcn-definition)
map <buffer> <Leader>r <Plug>(lcn-rename)
map <buffer> <C-q> <Plug>(lcn-hover)
