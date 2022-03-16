" Information
" {{{
" vim: foldmarker={{{,}}} tw=80 ft=vim fdm=marker
" Last Modified [ 2010-09-15 ]
" 
" This file defines mappings ("map")
"
" Here is an overview of map commands and in which mode they work:
"   ,----
"   | :map               Normal, Visual and Operator-pending
"   | :vmap              Visual
"   | :nmap              Normal
"   | :omap              Operator-pending
"   | :map!              Insert and Command-line
"   | :imap              Insert
"   | :cmap              Command-line
"   `----

"}}}


" Quickly edit/reload the vimrc  {{{
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" }}}
"
nmap \ "_

nmap <silent> <leader>q :bd<CR>
nmap <silent> <leader>ln :lnext<CR>
nmap <silent> <leader>lp :lprev<CR>

" C-\ - Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

map QQ :qall!<CR>

" Unmap Ex-Mode
:map Q <Nop>

noremap <F12>  :ALEToggleBuffer<CR>
map <F1>  :help 

" toggle highlight search (folke)
:map <F3> :if 1 == &hls \| noh \| else \| set hls \| endif \|<CR>

" paste mode
:map <F4> :set invpaste<CR><Bar>:echo "Paste Mode: " . strpart("OffOn", 3 * &paste, 3)<CR>

imap <F2> <Esc><F2>i
imap <F3> <Esc><F3>i
imap <F4> <Esc><F4>i
imap <F5> <Esc><F5>i
imap <F6> <Esc><F6>i
imap <F7> <Esc><F7>i
imap <F8> <Esc><F8>i
imap <F9> <Esc><F9>i
imap <F10> <Esc><F10>i
imap <F11> <Esc><F11>i
imap <F12> <Esc><F12>i

" Call sudo
cmap w!! w !sudo tee % >/dev/null

" Camelcase bindings
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" sunmap w
" sunmap b
"sunmap e  

nmap \ "_

imap <A-BS> <C-W>

map <leader>d "_d
map <leader>c "_c

nmap <BS> "_xh
nmap <A-BS> "_db
nmap <A-Del> "_dw

let g:grepper = {'tools':     ['ag', 'git']}

nmap g= g+

noremap <Esc> <C-\><C-n>

nnoremap <silent> <leader>u :MundoToggle<CR>
nnoremap <silent> <leader><Return> mQHmWgggqG`Wzt`Q
vnoremap <silent> <leader><Return> gq
