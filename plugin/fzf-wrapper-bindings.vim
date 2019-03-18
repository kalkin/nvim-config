command! -bang VimConfig call fzf#run(fzf#wrap({'source': "ag --ignore-dir bundle '' -l ~/.config/nvim/"}))
command! -bang ZshConfig call fzf#run(fzf#wrap({'source': "ag --ignore-dir bundle '' -l ~/.config/zsh/"}))

nmap <silent> <leader>b :Buffers<CR>
nmap <silent> <leader>f :GFiles<CR>
nmap <silent> <leader>g :Ag
nmap <silent> <leader>h :Helptags<CR>
nmap <silent> <leader>O :Files<CR>
nmap <silent> <leader>t :Tags<CR>
nmap <silent> <leader>v :VimConfig <CR>
nmap <silent> <leader>z :ZshConfig <CR>
