command! -bang VimConfig call fzf#run(fzf#wrap({'source': "ag --ignore-dir bundle '' -l ~/.config/nvim/"}))
command! -bang ZshConfig call fzf#run(fzf#wrap({'source': "ag --ignore-dir bundle '' -l ~/.config/zsh/"}))
command! -bang FilesWithoutIgnored call fzf#run(fzf#wrap({'source': "ag -l "}))

nmap <silent> <leader>b :Buffers<CR>
nmap <silent> <leader>f :Files<CR>
nmap <silent> <leader>g :Ag
nmap <silent> <leader>h :Helptags<CR>
nmap <silent> <leader>o :execute 'GFiles' '--' getcwd()<CR>
nmap <silent> <leader>O :FilesWithoutIgnored<CR>
nmap <silent> <leader>t :Tags<CR>
nmap <silent> <leader>v :VimConfig <CR>
nmap <silent> <leader>z :ZshConfig <CR>

" Use vim-devicons
let g:fzf_preview_use_dev_icons = 1
let g:fzf_preview_dev_icon_prefix_length = 1
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border' : 'rounded' } }
