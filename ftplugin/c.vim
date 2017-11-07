setlocal shiftwidth=8
setlocal tabstop=8
setlocal foldmethod=syntax
setlocal noexpandtab
let b:ale_linters = { 'c': ['gcc'] }
let g:ale_c_gcc_options='-Wall -Wpedantic -Wextra -fno-strict-aliasing -std=c11 -Wshadow -fopenmp'
