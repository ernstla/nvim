" Vim color file
" Maintainer: Thomas Ernst <thomas.ernst@ebenefuenf.de>

"set background=light
hi clear
if exists('syntax_on')
	syntax reset
endif

set background=light
let colors_name = "lighternst"

highlight Normal ctermfg=237 ctermbg=230 cterm=NONE
highlight Folded ctermfg=243 ctermbg=187 cterm=NONE
highlight ColorColumn ctermfg=NONE ctermbg=NONE cterm=NONE
highlight Cursorline ctermfg=NONE ctermbg=NONE cterm=NONE
highlight CursorLineNr ctermfg=15 ctermbg=241 cterm=NONE
if has("autocmd")
    autocmd InsertEnter * highlight CursorLineNr ctermfg=15 ctermbg=124 cterm=NONE
    autocmd InsertLeave * highlight CursorLineNr ctermfg=15 ctermbg=241 cterm=NONE
endif
highlight Visual ctermfg=15 ctermbg=32 cterm=NONE

" highlight Boolean
" highlight Character
highlight Comment ctermfg=241 ctermbg=NONE cterm=NONE
" highlight Conditional
highlight Constant ctermfg=105 ctermbg=NONE cterm=NONE
highlight Cursor ctermfg=NONE ctermbg=124 cterm=NONE
highlight iCursor ctermfg=NONE ctermbg=NONE cterm=NONE
" highlight Debug
" highlight Define
highlight Delimiter ctermfg=166 ctermbg=NONE cterm=NONE
highlight DiffAdd ctermfg=193 ctermbg=58 cterm=NONE
highlight DiffChange ctermfg=2 ctermbg=193 cterm=NONE
highlight DiffDelete ctermfg=223 ctermbg=88 cterm=NONE
highlight DiffText ctermfg=196 ctermbg=223 cterm=NONE
" highlight Directory
highlight Error ctermfg=166 ctermbg=187 cterm=NONE
highlight ErrorMsg ctermfg=15 ctermbg=52 cterm=NONE
" highlight Exception
highlight SignColumn ctermfg=NONE ctermbg=187 cterm=NONE
highlight FoldColumn ctermfg=NONE ctermbg=187 cterm=NONE
" highlight Float
" highlight Function
highlight Identifier ctermfg=208 ctermbg=NONE cterm=NONE
highlight IncSearch ctermfg=0 ctermbg=106 cterm=NONE
" highlight Include
" highlight Keyword
" highlight Label
highlight LineNr ctermfg=247 ctermbg=187 cterm=NONE
" highlight Macro
highlight MatchParen ctermfg=208 ctermbg=NONE cterm=NONE
" highlight ModeMsg
" highlight MoreMsg
highlight NonText ctermfg=60 ctermbg=NONE cterm=NONE " Tilde Zeichen leere Zeile
" highlight Number
" highlight Operator
highlight Pmenu ctermfg=0 ctermbg=DarkGray cterm=NONE
highlight PmenuSel ctermfg=0 ctermbg=Gray cterm=NONE
" highlight PreCondit
highlight PreProc ctermfg=169 ctermbg=NONE cterm=NONE
" highlight Question
" highlight Region
" highlight Repeat
highlight Search ctermfg=0 ctermbg=106 cterm=NONE
" highlight SpecialChar
" highlight SpecialComment
highlight Special ctermfg=15 ctermbg=NONE cterm=NONE
" highlight SpecialKey
highlight SpellBad ctermfg=NONE ctermbg=52 cterm=NONE
highlight SpellCap ctermfg=NONE ctermbg=52 cterm=NONE
highlight Statement ctermfg=36 ctermbg=NONE cterm=NONE
highlight StatusLine ctermfg=15 ctermbg=187 cterm=NONE
highlight StatusLineNC ctermfg=241 ctermbg=187 cterm=NONE
" highlight StorageClass
highlight String ctermfg=64 ctermbg=NONE cterm=NONE
" highlight Structure
highlight TabLineFill ctermfg=0 ctermbg=187 cterm=NONE
highlight TabLine ctermfg=248 ctermbg=228 cterm=NONE
highlight TabLineSel ctermfg=NONE ctermbg=NONE cterm=NONE
highlight TabLineMod ctermfg=NONE ctermbg=NONE cterm=NONE
highlight TabLineModSel ctermfg=NONE ctermbg=NONE cterm=NONE
" highlight Tag
highlight Title ctermfg=166 ctermbg=NONE cterm=NONE
highlight Todo ctermfg=153 ctermbg=NONE cterm=NONE
" highlight Typedef
highlight Type ctermfg=31 ctermbg=NONE cterm=NONE
" highlight Underlined
highlight VertSplit ctermfg=187 ctermbg=187 cterm=NONE
highlight VisualNOS ctermfg=NONE ctermbg=NONE cterm=NONE
" highlight WarningMsg
highlight WildMenu ctermfg=0 ctermbg=106 cterm=NONE


" NetRW
highlight netrwDir ctermfg=38 ctermbg=NONE cterm=NONE
highlight netrwClassify ctermfg=38 ctermbg=NONE cterm=NONE


" Airline
highlight airlineN1 ctermfg=237 ctermbg=214 cterm=bold
highlight airlineCtrlP1 ctermfg=15 ctermbg=240 cterm=NONE
highlight airlineCtrlP2 ctermfg=15 ctermbg=238 cterm=NONE

" Syntastic
highlight SyntasticWarningSign ctermfg=166 ctermbg=235 cterm=NONE

" vim-bookmark
highlight BookmarkSign ctermfg=38 ctermbg=NONE cterm=NONE
highlight BookmarkAnnotationSign ctermfg=38 ctermbg=NONE cterm=NONE
