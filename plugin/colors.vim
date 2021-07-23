" Figure out the current terminal background
if split(system('colorscheme || echo 3'), '\n')[0] ==# '0'
    set background=light
else
    if !empty($BACKGROUND)
        let &background = $BACKGROUND
    else
        set background=dark
    endif
endif

set termguicolors  " Terminal uses 24-bit colors.
set colorcolumn=+1 " Mark max textwidth with a colored column
set cursorline     " Highlight the screen line of the cursor
set hlsearch       " Highlight the search results
colorscheme NeoSolarized

" Improve default highlighting
highlight Keyword gui=bold ctermfg=2 guifg=#719e07
highlight Statement gui=bold ctermfg=2 guifg=#719e07
highlight Operator gui=none ctermfg=2 guifg=#719e07

function g:ToggleColorScheme()
    let &background = ( &background ==? 'dark'? 'light' : 'dark' )
    highlight Keyword gui=bold ctermfg=2 guifg=#719e07
    highlight Statement gui=bold ctermfg=2 guifg=#719e07
    highlight Operator gui=none ctermfg=2 guifg=#719e07
endfunction

" Toggle color scheme
map <Leader>sg :call g:ToggleColorScheme()<CR>

" Show highlighting group at point
nmap <silent> <Leader>ss :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
            \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
            \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
            \ . ">"<CR>
