let b:ale_linters = ['cargo', 'analyzer']
let g:ale_rust_cargo_use_clippy = 1
let g:ale_rust_analyzer_config ={
            \ 'diagnostics': { 'disabled': ['inactive-code'] }
            \}

map <buffer> <C-]> <Plug>(lcn-definition)
map <buffer> <C-w>] :vsplit<CR> <Plug>(lcn-definition)
map <buffer> <Leader>r <Plug>(lcn-rename)
map <buffer> <C-q> <Plug>(lcn-hover)

:nmap <buffer> <silent> <leader><Return> :ALEFix rustfmt<CR>
