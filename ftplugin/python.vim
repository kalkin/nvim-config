" Settings
" Often used abbreviations
iab <buffer> gpl2 # This program is free software; you can redistribute it and/or modify<CR># it under the terms of the GNU General Public License as published by<CR># the Free Software Foundation; either version 2 of the License, or<CR># (at your option) any later version.<CR>#<CR># This program is distributed in the hope that it will be useful,<CR># but WITHOUT ANY WARRANTY; without even the implied warranty of<CR># MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the<CR># GNU General Public License for more details.<CR>#<CR># You should have received a copy of the GNU General Public License along<CR># with this program; if not, write to the Free Software Foundation, Inc.,<CR># 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.<CR>#<CR>


iab <buffer> qubes_project #<CR># The Qubes OS Project, http://www.qubes-os.org<CR>#

iab <buffer> python2 #!/usr/bin/env python2<CR># -*- encoding: utf8 -*-
iab <buffer> python27 #!/usr/bin/env python2.7<CR># -*- encoding: utf8 -*-
iab <buffer> python3 #!/usr/bin/env python3
iab <buffer> MY # Copyright (C) <C-R>=strftime("%Y")<CR> Bahtiar `kalkin-` Gadimov <bahtiar@gadimov.de>
ab <buffer> print_function from __future__ print_function<CR>
iab <buffer> qubes_parser from qubes.tools QubesArgumentParser<CR>
iab <buffer> _main_ def main(args=None):<CR>return 0<CR><CR>if __name__ == '__main__':

map <buffer> <C-]> :call jedi#goto()<CR>
map <buffer> <C-w>] :vsplit<CR>:call jedi#goto()<CR>


" Set jedi verson
let g:jedi#force_py_version=3
" vim: fdm=indent tw=0
let b:ale_linters = ['bandit', 'yapf', 'isort', 'pylint']

setlocal equalprg=isort\ -\|yapf
