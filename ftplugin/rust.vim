setlocal omnifunc=LanguageClient#complete
let b:ale_linters = ['cargo', 'analyzer']
let g:ale_rust_cargo_use_clippy = 1
let g:ale_rust_cargo_clippy_options = '-- -W clippy::all -W clippy::pedantic -A clippy::non_ascii_literal -A clippy::implicit_return -A clippy::expect-used'

map <buffer> <C-]> <Plug>(lcn-definition)
map <buffer> <C-w>] :vsplit<CR> <Plug>(lcn-definition)
map <buffer> <Leader>r <Plug>(lcn-rename)
map <buffer> <C-q> <Plug>(lcn-hover)
