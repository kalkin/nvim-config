" Information 
" {{{
" vim:foldmarker={{{,}}} tw=80 ft=vim
" Last Modified [ 2010-09-16 ]
"
" This file just sources my configuration files. 
"
" }}}
if empty($XDG_DATA_HOME)
  let $XDG_DATA_HOME = $HOME.'/.local/share'
endif

if empty($XDG_CONFIG_HOME)
  let $XDG_CONFIG_HOME = $HOME.'/.config'
endif

let $NVIM_HOME = $XDG_CONFIG_HOME . '/nvim'

set viminfo+=n$XDG_DATA_HOME/nvim/viminfo

function! NullLsDependencies(info)
    if a:info.status ==# 'installed' || a:info.force || a:info.status ==# 'updated'
        :call system('pip install -U ansible-lint')
        :call system('cargo install selene stylua')
        :call system('luarocks install --local luacheck')
        :call system('luarocks install --local lanes')
    else
        :call system('pip uninstall -y ansible-lint')
        :call system('cargo uninstall selene stylua')
        :call system('luarocks remove luacheck')
        :call system('luarocks remove lanes')
    endif
endfunction

function! InstallTsLanguages(info)
    if a:info.status ==# 'installed' || a:info.force
        :TSInstall maintained
        :call system('pip install -U jedi-language-server python-lsp-server')
    elseif a:info.status ==# 'updated'
        :TSUpdate
        :call system('pip install -U jedi-language-server python-lsp-server')
    else
        :call system('pip uninstall -y jedi-language-server python-lsp-server')
    endif
endfunction


call plug#begin()
    Plug 'aklt/plantuml-syntax'
    Plug 'airblade/vim-gitgutter'
    Plug 'chrisbra/NrrwRgn'
    Plug 'dahu/vim-lotr'
    Plug 'godlygeek/tabular'
    Plug 'hashivim/vim-terraform'
    Plug 'icymind/NeoSolarized'
    Plug 'junegunn/fzf.vim'
    Plug 'lervag/vimtex', { 'for': 'tex' }
    Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }
    Plug 'simnalamburt/vim-mundo'
    Plug 'rickhowe/diffchar.vim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'pearofducks/ansible-vim', { 'for': 'yaml.ansible' }
    Plug 'pseewald/vim-anyfold', { 'for': 'ada' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'tarekbecker/vim-yaml-formatter'
    Plug 'tpope/vim-eunuch' " enuch.vim: Helpers for UNIX
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-vinegar'
    Plug 'Raku/vim-raku', { 'for': 'raku' }
    Plug 'vito-c/jq.vim', { 'for': 'jq' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': function('InstallTsLanguages')}
    Plug 'tami5/lspsaga.nvim'  " UI around LSP
    Plug 'soli/prolog-vim'
    Plug 'zaid/vim-rec'

    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

    Plug 'knubie/vim-kitty-navigator', {'do': 'cp ./*.py ~/.config/kitty/'}
    Plug 'gko/vim-coloresque' "  css/less/sass/html color preview for vim

    Plug 'nvim-lua/plenary.nvim' " Library with handy lua functions for neovim
    Plug 'jose-elias-alvarez/null-ls.nvim' , {'do': function('NullLsDependencies')} " Bridge in non-lsp tools in LSP

    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'folke/trouble.nvim'
call plug#end()

source $NVIM_HOME/settings.vim
source $NVIM_HOME/misc.vim
source $NVIM_HOME/autocmd.vim
source $NVIM_HOME/abbreviation.vim
source $NVIM_HOME/bindings.vim
