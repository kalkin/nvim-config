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

" [global] |'backspace'| how backspace works at start of line
set bs=2

" }}}

" Options initiating with [C]
" {{{


" [buffer] |'cindent'|  do C program indenting
set cin 

" [global] |'cmdheight'| Disable the 'Press RETURN...' - Messages
set ch=2

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
set cot=menu,menuone,preview,noselect,noinsert

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
set complete+=],k


" [buffer] |'confirm'| Ask what to do about unsaved/read-only files
set cf
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

" [global] |'history'| Number of command-lines that are remembered
set hi=1000
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
" [buffer] |'matchpairs'| Pairs of characters that "%" can match
set mps+=<:>
set mps+=｢:｣
set mps+=„:”
set mps+=«:»

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

" [glo-lo] |'pa'| This is a list of directories which will be searched when
" using the gf|, [f, ]f, ^Wf, |:find|, |:sfind|, |:tabfind| and other commands,
" Default set to ".,/usr/include,,"
set path=.,,
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

set spell

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
set wig=*.o,*.obj,*swp,*.bac,*.class,*.pyc,*.pyo,*.png,*.jpg,*.ali,*.lexch,*.adb.stderr,*.adb.stdout,*.ali,*.bexch,*.cswi
" Ada stuff to ignore
set wig+=*.ads.stdout,*.ads.stderr,*.adb.stdout,*.adb.stderr,
set wig+=gnatcheck-source-list.out,*.a

" }}}
