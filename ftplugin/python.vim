" setlocal colorcolumn=80

" Zeige zu lange Zeilen an. Alles was länger als 79 is PEP-8
map <silent> <Leader>l
      \ :if exists('w:long_line_match') <Bar>
      \   call matchdelete(w:long_line_match) <Bar>
      \   unlet w:long_line_match <Bar>
      \ else <Bar>
      \   let w:long_line_match = matchadd('ErrorMsg','\%80v.*',-1) <Bar>
      \ endif<CR>

