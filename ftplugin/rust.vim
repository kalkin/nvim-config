let b:ale_linters = ['cargo', 'analyzer']
let g:ale_rust_cargo_use_clippy = 1

map <buffer> <C-]> <Plug>(lcn-definition)
map <buffer> <C-w>] :vsplit<CR> <Plug>(lcn-definition)
map <buffer> <Leader>r <Plug>(lcn-rename)
map <buffer> <C-q> <Plug>(lcn-hover)

setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldmethod=expr

:nmap <buffer> <silent> <leader><Return> :ALEFix rustfmt<CR>
