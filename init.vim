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
    Plug 'vim-airline/vim-airline'
    Plug 'davidzchen/vim-bazel'
    Plug 'fisadev/vim-isort'
    Plug 'icymind/NeoSolarized'
    Plug 'mhinz/vim-grepper'
    Plug 'neomake/neomake'
    Plug 'niklasl/vim-rdf'
    Plug 'vim-perl/vim-perl6'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'xolox/vim-lua-ftplugin'
    Plug 'xolox/vim-misc'
call plug#end()
source ~/.config/nvim/vimsettings
source ~/.config/nvim/functions.vim
source ~/.config/nvim/vimmisc
source ~/.config/nvim/vimautocmd
source ~/.config/nvim/vimabbreviation
source ~/.config/nvim/vimbindings

