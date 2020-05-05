syntax on
if split(system('colorscheme || echo 3'), '\n')[0] ==# '0'
    set background=light
else
    set background=dark
endif
set termguicolors  " Terminal uses 24-bit colors.
set colorcolumn=+1 " Mark max textwidth with a colored column
set cursorline     " Highlight the screen line of the cursor
set hlsearch       " Highlight the search results
colorscheme NeoSolarized
