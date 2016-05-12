setlocal foldmethod=indent

" Often used abbreviations
iab gpl2 # This program is free software; you can redistribute it and/or modify<CR># it under the terms of the GNU General Public License as published by<CR># the Free Software Foundation; either version 2 of the License, or<CR># (at your option) any later version.<CR>#<CR># This program is distributed in the hope that it will be useful,<CR># but WITHOUT ANY WARRANTY; without even the implied warranty of<CR># MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the<CR># GNU General Public License for more details.<CR>#<CR># You should have received a copy of the GNU General Public License along<CR># with this program; if not, write to the Free Software Foundation, Inc.,<CR># 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.<CR>#<CR>

iab python2 #!/usr/bin/env python2<CR># -*- encoding: utf8 -*-
iab python27 #!/usr/bin/env python2.7<CR># -*- encoding: utf8 -*-
iab python3 #!/usr/bin/env python3

iab MY # Copyright (C) <C-R>=strftime("%Y")<CR> Bahtiar `kalkin-` Gadimov <bahtiar@gadimov.de>

ab print_function from __future__ print_function<CR>
iab _main_ def main(args=None):<CR>return 0<CR><CR>if __name__ == '__main__':
