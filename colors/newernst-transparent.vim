hi clear
if exists("syntax_on")
  syntax reset
endif

"Load the 'base' colorscheme - the one you want to alter
runtime colors/newernst.vim

"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "newernst-tranparent"

"Clear the colors for any items that you don't like
hi clear StatusLine
hi clear StatusLineNC

highlight Normal guifg=#c7cadf guibg=NONE gui=NONE ctermfg=253 ctermbg=NONE cterm=NONE
highlight LineNr guifg=#1f323f guibg=NONE gui=NONE ctermfg=240 ctermbg=NONE cterm=NONE
highlight SignColumn guifg=#586e75 guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
highlight FoldColumn guifg=#586e75 guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
highlight VertSplit guifg=#1a152a guibg=NONE gui=NONE ctermfg=236 ctermbg=NONE cterm=NONE
highlight CursorLineNr guifg=#ceecee guibg=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=NONE
highlight NonText guifg=#1f323f guibg=NONE gui=NONE ctermfg=236 ctermbg=NONE cterm=NONE " Empty line's tilde character
highlight StatusLine guifg=#ffffff guibg=#090909 gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
highlight TabLineFill guifg=NONE guibg=NONE gui=NONE ctermfg=0 ctermbg=NONE cterm=NONE
highlight TabLine guifg=#586e75 guibg=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
highlight TabLineSel guifg=#ceecee guibg=NONE gui=bold ctermfg=106 ctermbg=NONE cterm=NONE
highlight TabLineMod guifg=#934242 guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
highlight TabLineModSel guifg=#DC322F guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=NONE
highlight ColorColumn guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
highlight SignifyLineAdd guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=235 cterm=NONE
highlight SignifyLineChange guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=235 cterm=NONE
highlight SignifyLineDelete guifg=#cb4b16 guibg=NONE gui=NONE ctermfg=166 ctermbg=235 cterm=NONE
highlight SignifyLineChangeDelete guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=235 cterm=NONE
highlight SignifyLineDeleteFirstLine guifg=#cb4b16 guibg=NONE gui=NONE ctermfg=166 ctermbg=235 cterm=NONE
highlight SignifySignAdd guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=235 cterm=NONE
highlight SignifySignChange guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=235 cterm=NONE
highlight SignifySignDelete guifg=#cb4b16 guibg=NONE gui=NONE ctermfg=166 ctermbg=235 cterm=NONE
highlight SignifySignChangeDelete guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=235 cterm=NONE
highlight SignifySignDeleteFirstLine guifg=#cb4b16 guibg=NONE gui=NONE ctermfg=166 ctermbg=235 cterm=NONE
