" vim: fmr={{{,}}} tw=80 fdm=marker ft=vim
" Information {{{
"
" This file defines the vim settings ("set"). They are ordered alphabetically to
" make it easier to access a specific item. Basically a simple way to sort data
" ☺. These are not all the possible settings, but the ones that I have found
" relevant to control. For general info on options see ':h options'. To see all
" options use ':help option-list'
"
" Settings Description: {{{
" [global] ... global setting
" [buffer] ... local to a buffer
" [window] ... settings for a window
" [glo-lo] ... global or local (buffer) setting. :setlocal for local value
" 
" Some mappings and options are commented out. Remove the comment to enable them.
" }}}
" 
" }}}

" Options initiating with [A]
" {{{

" [glo-lo] |'autoread'| autom. reread file when changed outside of Vim
set ar

" }}}

" Options initiating with [B]
" {{{

" [global] |'background'| "dark" or "light", used for highlight colors
set bg=dark 

" [global] |'backspace'| how backspace works at start of line
set bs=2

" [buffer] |'bufhidden'| what to do when buffer is no longer in window
" ,--------[ Options ]
" | <empty>	    follow the global 'hidden' option
" | hide		hide the buffer (don't unload it), also when 'hidden' is not
" |             set
" | unload	    unload the buffer, also when 'hidden' is set or using :hide
" | delete	    delete the buffer from the buffer list, also when 'hidden' is
" |             set or using :hide, like using :bdelete
" | wipe		wipe out the buffer from the buffer list, also when 'hidden'
" |             is set or using |:hide|, like using :bwipeout
" `--------
set bh=delete

" }}}

" Options initiating with [C]
" {{{


" [buffer] |'cindent'|  do C program indenting
set cin 

" [global] |'cmdheight'| Disable the 'Press RETURN...' - Messages
set ch=2

" [global] |'colorcolumn'| is a comma separated list of screen columns that are
" highlighted with ColorColumn hl-ColorColumn.
set cc=+1

" [global] |'cmdwinheight'| Fives lines should be enough
set cwh=5

" [global] |'cp'| Vim either more Vi-compatible or make Vim really usefull
set nocompatible        "this is vim not vi!

set clipboard=unnamedplus

" [global] |'completeopt'| Options for Insert mode completion
"
" ,--------[ Options ]
" | menu	    Use a popup menu to show the possible completions.
" | menuone     Use the popup menu also when there is only one match.
" | longest     Only insert the longest common text of the matches." 
" | preview     Show extra information about the currently selected
" |             completion in the preview window. 
" `--------
"
set cot=menu,preview,longest

" [buffer] |'complete'| Specify how Insert mode completion works
"                       Default set to: '.,w,b,u,t,i'
"
" ,--------[ Options ]
" | .       scan the current buffer ('wrapscan' is ignored)
" | w       scan buffers from other windows
" | b       scan other loaded buffers that are in the buffer list
" | u       scan the unloaded buffers that are in the buffer list
" | U       scan the buffers that are not in the buffer list
" | k       scan the files given with the 'dictionary' option
" | kspell  use the currently active spell checking |spell|
" | k{dict}	scan the file {dict}.  Several \"k\" flags can be given, patterns are
" |         valid too.  For example: >
" | 		:set cpt=k/usr/dict/*,k~/spanish
" |         <	s	scan the files given with the 'thesaurus' option
" | s{tsr}	scan the file {tsr}.  Several \"s\" flags can be given, patterns are
" |         valid too.
" | i       scan current and included files
" | d       scan current and included files for defined name or macro
" |         |i_CTRL-X_CTRL-D|
" | ]       tag completion
" | t       same as \"]\"
" `--------
set complete+=k


" [buffer] |'confirm'| Ask what to do about unsaved/read-only files
set cf

" [buffer] |'cursorline'| Highlight the screen line of the cursor
set cul

" }}}

" Options initiating with [D]
" {{{

" [global] |'digraph'| Enable the entering of digraphs in Insert mode
" set dg

" [global] |'display'| to display as much as possible of the last line in a
"                      window instead of displaying the '@' symbols.
set dy=lastline

" }}}

" Options initiating with [E]
" {{{

" [global] |'encoding'| encoding used internally
set encoding=utf-8

" [buffer] |'expandtab'| Tabs are expanded to spaces
set expandtab
" }}}

" Options initiating with [F]
" {{{

" [buffer] |'fileencoding'| multicultural, even in encodings
set fenc=utf-8

" [global] |'fillchars'| Characters to fill the statuslines and vertical
" separators.  It is a comma separated list of items:
"	  item		default		Used for ~
"	  stl:c		' ' or '^'	statusline of the current window
"	  stlnc:c	' ' or '='	statusline of the non-current windows
"	  vert:c	'|'		vertical separators |:vsplit|
"	  fold:c	'-'		filling 'foldtext'
"	  diff:c	'-'		deleted lines of the 'diff' option
" (default "vert:|,fold:-")

set fcs=vert:\|,fold:\ 


" [window] |'fdm'| Is folding really evile?
set foldmethod=marker

" [global] |'foldclose'| when set to all a fold is closed when the cursor isn't
"  in it
"set fcl

" [window] |'fmr'| markers used when 'foldmethod' is marker
set foldmarker={,}


set foldlevel=1

" [window] |'foldcolumn'| If n>0 a colum with width n is shown which indicates
" foldings
set fdc=0

" [global] |'foldopen'| Specifies for which type of commands folds will be openx
" ,--------[ Options ]
" | item    command
" | all     any
" | block   "(", "{", "[[", "[{", etc.
" | hor     horizontal movements: "l", "w", "fx", etc
" | insert  any command in Insert mode
" | jump    far jumps: "G", "gg" etc..
" | mark    jumping to mark
" | percent "%"
" | quickfix ":cn", ":crew", ":make" etc
" | search   search for a pattern "/", "n", "*", "gd"
" | tag     jumping to a tag
" | undo    undo or redo
" `--------
set fdo=insert,jump,tag,mark,quickfix,search

" }}}

" Options initiating with [G]
" {{{
set guifont=Fira\ Mono\ 12
set guioptions-=TrL

" [global] |'greprg'| Program to use for the |:grep| command.
" default  "grep -n $* /dev/null"

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" }}}
"
" Options initiating with [H]
" {{{

" [global] |'hlsearch'| Simple press <F4> to stop it.
set hls 

" [global] |'history'| Number of command-lines that are remembered
set hi=1000

set hidden

" }}}

" Options initiating with [I]
" {{{
" [incsearch] |'incsearch'| While typing a search command, show where the
" pattern, as it was typed so far, matches.
set is

" [global] |'ignorecase'| Ignore the case in search patterns
set ic

" [buffer] |'infercase'| adjust case of match for keyword completion
" set inf

" }}}

" Options initiating with [L]
" {{{
" [global] |'laststatus'| show statusline
set ls=2
" }}}

" Options initiating with [M]
" {{{
" [buffer] |'matchparis'| Pairs of characters that "%" can match
set mps+=<:>

" [global] |'mouse'| Use mouse in vim on console, xterm, ect..
" ,------[ Mouse Options ]-----
" | y    - Normal Mode
" | v    - Visual Mode 
" | i    - Insert Mode 
" | c    - Command-line Mode 
" | h    - all previous modes, when editing a help file
" | a    - all previous modes
" | r    - for hit-enter and more-mode
" `-----
set mouse=a 
" }}}

" Options initiating with [N]
" {{{

" [buffer] |'nrformats'| Number formats recognized for CTRL-A command
set nf=alpha,octal,hex

" [window] |'number'| Show line numbers
set nu

" [window] |'numberwidth'| Minimal number of columns to use for the line number.
set nuw=3
" }}}

" Options initiating with [P]
" {{{

" [global] |'pastetoggle'| Key code that causes 'paste' to toggle
set pt=<F4>

" [global] |'previewheight'| Height of the preview window
set pvh=20

set printoptions=paper:A4,number:y,header:1,left:5mm,top:5mm,bottom:5mm,right:5mm,duplex:off  "printing options

" }}}

" Options initiating with [R]
" {{{

" [global] |'ruler'| Show cursor line and column in the status line
set ru

" }}}

" Options initiating with [S]
" {{{

" [global] |'shiftround'| Round indent to multiple of 'shiftwidth'
set sr

" [bufferr] |'shiftwidth'| Number of spaces to use for (auto)indent step
set sw=4           "shift by 4 characters

" [global] |'showcmd'| Show (partial) command in status line
set sc

" [global] |'showmatch'|  when a bracket is inserted, briefly jump to the matching one 
set sm

" [global] |'showmode'| display current mode
set smd

" [global] |'smartcase'| no ignore case when pattern has uppercase
set scs

" [global] |'smarttab'| Use 'shiftwidth' when inserting <Tab>
set sta

" [global] |'softtabstop'| Number of spaces that <Tab> uses while editing
set sts=4

" [window] |'spell'| Enable spell checking
" set spell

" [buffer] |'spelllang| Language(s) to do spell checking for
set spelllang =en,de_20

" [global] |'splitbelow'| New window from split is below the current one
set sb

" [global] |'splitright'| New window is put right of the current one
set nospr

" [global] |'spellsuggest'| Method(s) used to suggest spelling corrections
set sps=best,10

" [global] |'statusline'] Custom format for the status line
set stl=%<[%n]\ %F\ \ Filetype=\%Y\ \ %r\ %1*%m%*%w%=%(Line:\ %l%)%4(%)Column:\ %5(%c%V/%{strlen(getline(line('.')))}%)\ %4(%)%p%%

" }}}

" Options initiating with [T]
" {{{

" [global] |'ttyfast'| are we using a fast terminal? Yeppa!!!!11
set tf

" [buffer] |'tabstop'| number of spaces that a <Tab> in the file counts for
set ts=4

" [global] |'termencoding'| Character encoding used by the terminal
set tenc=utf-8


" [global] |'terse'| shorten some messages
set terse

" [buffer] |'textwidth'| Maximum width of text that is being inserted
set tw=80

" [global] |'title'| Let Vim set the title of the window
set title

" }}}

" Options initiating with [U]
" {{{

set uc=50

if has('persistent_undo')
    " enable autowrite and persistent undo
    set aw
    set undolevels=5000
    set undodir=$HOME/.local/share/neovim/undo-files
    set undofile
endif

" }}}


" Options initiating with [V]
" {{{

" [global] |'virtualedit'| When to use virtual editing
set ve=block,onemore

" }}}


" Options initiating with [W]
" {{{

" [global] |'wildmenu'| When 'wildmenu' is on, command-line completion operates in an
"                       enhanced mode. 
set wmnu

" [global] |'wildmode'| mode for 'wildchar' command-line expansion
set wim=list:longest

" [global] |'wildignore'|  A list of file patterns which are ignored on
" completing files or directories
set wig=*.o,*.obj,*swp,*.bac,*.class,*.pyc,*.pyo,*.png,*.jpg

" }}}