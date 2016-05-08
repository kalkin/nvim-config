" GNU Coding Standards
setlocal cindent
setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal textwidth=79
setlocal fo-=ro fo+=cql
let g:syntastic_c_compiler_options="-Wall -Wpedantic -Wextra -fno-strict-aliasing -std=c11 -Wshadow"

nmap <silent> <leader>ff :!indent %<CR><CR>
