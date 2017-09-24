" Information 
" {{{
" vim:foldmarker={{{,}}} tw=80 ft=vim
" Last Modified [ 2010-09-16 ]
"
" This file just sources my configuration files. 
"
" }}}
call plug#begin('~/.config/nvim/bundle')
    Plug 'airblade/vim-gitgutter'
    Plug 'fisadev/vim-isort'
    Plug 'icymind/NeoSolarized'
    Plug 'mhinz/vim-grepper'
    Plug 'niklasl/vim-rdf'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-perl/vim-perl6'
    Plug 'w0rp/ale'
    Plug 'xolox/vim-lua-ftplugin'
    Plug 'xolox/vim-misc'
    Plug 'zah/nim.vim'
call plug#end()
source ~/.config/nvim/settings.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/misc.vim
source ~/.config/nvim/autocmd.vim
source ~/.config/nvim/abbreviation.vim
source ~/.config/nvim/bindings.vim

