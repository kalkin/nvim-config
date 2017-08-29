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
nmap <silent> <leader>vm :tabe ~/.config/nvim/vimmisc<CR>
nmap <silent> <leader>vs :tabe ~/.config/nvim/vimsettings<CR>
nmap <silent> <leader>vb :tabe ~/.config/nvim/vimbindings<CR>
nmap <silent> <leader>va :tabe ~/.config/nvim/vimabbreviation<CR>
nmap <silent> <leader>vi :tabe ~/.config/nvim/init.vim<CR>
nmap <silent> <leader>sv :so ~/.config/nvim/init.vim<CR>
" }}}
"
nmap <silent> <leader>e :call fzf#run(fzf#wrap({'source':'ag -g "" ~/.config/nvim/'}))<CR>
nmap <silent> <leader>o :call fzf#run(fzf#wrap({'source':'ag -g ""'}))<CR>
nmap \ "_

function! s:buflist()
	redir => ls
	silent ls
	redir END
	return split(ls, '\n')
endfunction

function! s:bufopen(e)
	execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>b :call fzf#run({
			\   'source':  reverse(<sid>buflist()),
			\   'sink':    function('<sid>bufopen'),
			\   'options': '+m',
			\   'down':    len(<sid>buflist()) + 2
			\ })<CR>

command! FZFMru call fzf#run({
            \  'source':  v:oldfiles,
            \  'sink':    'e',
            \  'options': '-m -x +s',
            \  'down':    '40%'})

function! s:tags_sink(line)
	let parts = split(a:line, '\t\zs')
	let excmd = matchstr(parts[2:], '^.*\ze;"\t')
	execute 'silent e' parts[1][:-2]
	let [magic, &magic] = [&magic, 0]
	execute excmd
	let &magic = magic
endfunction

function! s:tags()
	if empty(tagfiles())
		echohl WarningMsg
		echom 'Preparing tags'
		echohl None
		call system('ctags -R')
	endif

	call fzf#run({
				\ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
				\            '| grep -v -a ^!',
				\ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
				\ 'down':    '40%',
				\ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()

nmap <silent> <leader>m :FZFMru<CR>
nmap <silent> <leader>t :Tags<CR>
nmap <silent> <leader>s :Yanks<CR>
nmap <silent> <leader>q :bd<CR>
nmap <silent> <leader>u :UndotreeToggle<CR>
nmap <silent> <leader>ln :lnext<CR>
nmap <silent> <leader>lp :lprev<CR>

nmap <silent> <leader>f :find 


" C-\ - Open the definition in a new tab
" A-] - Open the definition in a vertical split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

map q<SPACE> :bd<CR>
map QQ :qall!<CR>

" Unmap Ex-Mode
:map Q <Nop>

noremap <S-F12> :lclose<CR>
noremap <F12>  :lopen<CR>
map <F1>  :help 

" toggle highlight search (folke)
:map <F3> :if 1 == &hls \| noh \| else \| set hls \| endif \|<CR>

" paste mode
:map <F4> :set invpaste<CR><Bar>:echo "Paste Mode: " . strpart("OffOn", 3 * &paste, 3)<CR>

" Toggle spell checking between en_us and de_20 (new spelling
:map <F7> :if 1 == &spell \| set nospell \| else \| set spell \| endif \|<CR>

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


" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Call sudo
cmap w!! w !sudo tee % >/dev/null

" Camelcase bindings
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" sunmap w
" sunmap b
"sunmap e  


" Git fugitive bindings {{{
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gc :Gcommit --verbose<CR>
nmap <silent> <leader>gC :Gcommit --amend --verbose<CR>
nmap <silent> <leader>ga :Gwrite<CR>
" }}}
nmap \ "_

imap <A-BS> <C-W>

map <leader>d "_d
map <leader>c "_c

nmap <BS> "_xh
nmap <A-BS> "_db
nmap <A-Del> "_dw

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>:


let g:grepper = {'tools':     ['ag', 'git']}

nmap g= g+

inoremap <expr>  <C-K>   HUDG_GetDigraph()  