" Use completion-nvim in every buffer
augroup auto_completion
    autocmd BufEnter * lua require'completion'.on_attach()
augroup END
