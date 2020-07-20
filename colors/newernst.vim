" Vim color file
" Maintainer: Thomas Ernst <thomas.ernst@ebenefuenf.de>

"set background=light
hi clear
if exists('syntax_on')
	syntax reset
endif

set background=dark
let colors_name = "newernst"


" Chrome
highlight Normal guifg=#c7cadf guibg=#000510 gui=NONE ctermfg=253 ctermbg=233 cterm=NONE
highlight LineNr guifg=#1f323f guibg=#0a0e1a gui=NONE ctermfg=240 ctermbg=235 cterm=NONE
highlight SignColumn guifg=#586e75 guibg=#0a0e1a gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
highlight FoldColumn guifg=#586e75 guibg=#0a0e1a gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
highlight VertSplit guifg=#1a152a guibg=NONE gui=NONE ctermfg=236 ctermbg=236 cterm=NONE
highlight CursorLineNr guifg=#ceecee guibg=#0a0e1a gui=bold ctermfg=15 ctermbg=241 cterm=NONE
highlight NonText guifg=#1f323f guibg=#0a0e1a gui=NONE ctermfg=236 ctermbg=NONE cterm=NONE " Empty line's tilde character
highlight TabLineFill guifg=NONE guibg=#1a1d2a gui=NONE ctermfg=0 ctermbg=236 cterm=NONE
highlight TabLine guifg=#586e75 guibg=#1f323f gui=NONE ctermfg=248 ctermbg=236 cterm=NONE
highlight TabLineSel guifg=#ceecee guibg=#1f323f gui=bold ctermfg=106 ctermbg=238 cterm=NONE
highlight TabLineMod guifg=#934242 guibg=#1f323f gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
highlight TabLineModSel guifg=#DC322F guibg=#1f323f gui=bold ctermfg=NONE ctermbg=247 cterm=NONE

if exists("$VSCODE")
    highlight StatusLine guifg=#ffffff guibg=#4e4e4e gui=NONE ctermfg=15 ctermbg=240 cterm=NONE
    highlight TabLineFill guifg=NONE guibg=#061926 gui=NONE ctermfg=0 ctermbg=236 cterm=NONE
    highlight TabLineSel guifg=#ffffff guibg=#2c2c2c gui=bold ctermfg=106 ctermbg=238 cterm=NONE
endif


highlight Folded guifg=#98aeb5 guibg=#06302c gui=italic ctermfg=243 ctermbg=235 cterm=NONE
highlight ColorColumn guifg=NONE guibg=#00111b gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
highlight Cursorline guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
highlight Visual guifg=#ffffff guibg=#01708c gui=NONE ctermfg=15 ctermbg=24 cterm=NONE
highlight echoError guifg=#ffffff guibg=#df0000 gui=NONE ctermfg=15 ctermbg=160 cterm=NONE " custom highligh groups
highlight Cursor guifg=#ffffff guibg=#DC322F gui=NONE ctermfg=255 ctermbg=124 cterm=NONE
highlight iCursor guifg=#1c1c1c guibg=#ffffff gui=NONE ctermfg=255 ctermbg=255 cterm=NONE
highlight Delimiter guifg=#cb4b16 guibg=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE
highlight DiffAdd guifg=#c1d3b1 guibg=#485b39 gui=NONE ctermfg=193 ctermbg=58 cterm=NONE
highlight DiffChange guifg=#485b39 guibg=#c1d3b1 gui=NONE ctermfg=2 ctermbg=193 cterm=NONE
highlight DiffDelete guifg=#c47b7b guibg=#934242 gui=NONE ctermfg=223 ctermbg=88 cterm=NONE
highlight DiffText guifg=#934242 guibg=#f9c2c2 gui=NONE ctermfg=196 ctermbg=223 cterm=NONE
highlight Directory guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight Error guifg=#993300 guibg=NONE gui=NONE ctermfg=9 ctermbg=NONE cterm=NONE
highlight ErrorMsg guifg=#ffffff guibg=#df0000 gui=NONE ctermfg=15 ctermbg=52 cterm=NONE
highlight Identifier guifg=#fd971f guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight IncSearch guifg=#1c1c1c guibg=#8fbe00 gui=NONE ctermfg=0 ctermbg=106 cterm=NONE
highlight MatchParen guifg=#ffe7c5 guibg=#006f92 gui=NONE ctermfg=9 ctermbg=0 cterm=NONE
" highlight ModeMsg
" highlight MoreMsg
highlight Pmenu guifg=#ffffff guibg=#303540 gui=NONE ctermfg=0 ctermbg=8 cterm=NONE
highlight PmenuSel guifg=#ffffff guibg=#485b39 gui=NONE ctermfg=0 ctermbg=7 cterm=NONE
" highlight Question
highlight Search guifg=#1c1c1c guibg=#ffbb29 gui=NONE ctermfg=0 ctermbg=106 cterm=NONE
highlight QuickFixLine guifg=#ffffff guibg=#105563 gui=NONE ctermfg=0 ctermbg=106 cterm=NONE
highlight SpellBad guifg=#DC322F guisp=#ffffff guibg=NONE gui=undercurl ctermfg=NONE ctermbg=52 cterm=NONE
highlight SpellCap guifg=#fd971f guisp=#DC322F  guibg=NONE gui=undercurl ctermfg=NONE ctermbg=52 cterm=NONE
highlight StatusLineNC guifg=#586e75 guibg=#07303c gui=NONE ctermfg=241 ctermbg=236 cterm=NONE
highlight Title guifg=#cb4b16 guibg=NONE gui=NONE ctermfg=166 ctermbg=NONE cterm=NONE
" highlight Underlined
highlight VisualNOS guifg=#263946 guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" highlight WarningMsg
highlight WildMenu guifg=#1c1c1c guibg=#8fbe00 gui=NONE ctermfg=0 ctermbg=106 cterm=NONE

"
" --------- DEFAULT SYNTAX COLORS ---------
"

highlight Comment guifg=#586e75 guibg=NONE gui=NONE ctermfg=241 ctermbg=NONE cterm=NONE
" highlight Boolean
" highlight Character
highlight Conditional guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
" highlight Debug
" highlight Define
" highlight Exception
" highlight Float
" highlight Function
" highlight Include
highlight Keyword guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=149 ctermbg=NONE cterm=NONE
" highlight Label
" highlight Macro
" highlight Number
" highlight Operator
" highlight PreCondit
highlight PreProc guifg=#d33682 guibg=NONE gui=NONE ctermfg=169 ctermbg=NONE cterm=NONE
" highlight Region
" highlight Repeat
" highlight SpecialChar
" highlight SpecialComment
highlight Special guifg=#ffffff guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
" highlight SpecialKey
highlight Statement guifg=#2ebf7e guibg=NONE gui=NONE ctermfg=36 ctermbg=NONE cterm=NONE
" highlight StorageClass
highlight String guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
" highlight Structure
" highlight Tag
highlight Todo guifg=#95c2e8 guibg=#1c1c1c gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
highlight Type guifg=#268bd2 guibg=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
" highlight Typedef

"
" ----------------- LSP ----------------
"
highlight LspDiagnosticsError guifg=#db4b16 guibg=NONE gui=NONE ctermfg=166 ctermbg=NONE cterm=NONE
highlight LspDiagnosticsWarning guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
" highlight LspDiagnosticInformation
" highlight LspDiagnosticHint
" highlight LspReferenceText
" highlight LspReferenceRead
" highlight LspReferenceWrite

"
" --------- LANGUAGES & PLUGINS ---------
"

" - NetRW -
highlight netrwDir guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight netrwClassify guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE

" - Neomake/Ale -
highlight NeomakeErrorSign guifg=#cb4b16 guibg=NONE gui=NONE ctermfg=166 ctermbg=NONE cterm=NONE
highlight NeomakeWarningSign guifg=#ffbb29 guibg=#061926 gui=NONE ctermfg=214 ctermbg=235 cterm=NONE
highlight AleErrorSign guifg=#cb4b16 guibg=NONE gui=NONE ctermfg=166 ctermbg=NONE cterm=NONE
highlight AleWarningSign guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE

" - Signify -
highlight SignifyLineAdd guifg=#8fbe00 guibg=#0a0e1a gui=NONE ctermfg=106 ctermbg=235 cterm=NONE
highlight SignifyLineChange guifg=#8fbe00 guibg=#0a0e1a gui=NONE ctermfg=106 ctermbg=235 cterm=NONE
highlight SignifyLineDelete guifg=#cb4b16 guibg=#0a0e1a gui=NONE ctermfg=166 ctermbg=235 cterm=NONE
highlight SignifyLineChangeDelete guifg=#01a8c6 guibg=#0a0e1a gui=NONE ctermfg=38 ctermbg=235 cterm=NONE
highlight SignifyLineDeleteFirstLine guifg=#cb4b16 guibg=#0a0e1a gui=NONE ctermfg=166 ctermbg=235 cterm=NONE
highlight SignifySignAdd guifg=#8fbe00 guibg=#0a0e1a gui=NONE ctermfg=106 ctermbg=235 cterm=NONE
highlight SignifySignChange guifg=#8fbe00 guibg=#0a0e1a gui=NONE ctermfg=106 ctermbg=235 cterm=NONE
highlight SignifySignDelete guifg=#cb4b16 guibg=#0a0e1a gui=NONE ctermfg=166 ctermbg=235 cterm=NONE
highlight SignifySignChangeDelete guifg=#01a8c6 guibg=#0a0e1a gui=NONE ctermfg=38 ctermbg=235 cterm=NONE
highlight SignifySignDeleteFirstLine guifg=#cb4b16 guibg=#0a0e1a gui=NONE ctermfg=166 ctermbg=235 cterm=NONE

" - FZF -
highlight fzf1 guifg=#ffffff guibg=#061926 ctermfg=yellow ctermbg=blue
highlight fzf2 guifg=#ffbb29 guibg=#061926 ctermfg=yellow ctermbg=blue
highlight fzf3 guifg=#ffbb29 guibg=#061926 ctermfg=yellow ctermbg=blue

" - C -
highlight cBlock guifg=#efe1bf guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
highlight cCharacter guifg=#ccff99 guibg=NONE gui=NONE ctermfg=229 ctermbg=NONE cterm=NONE
highlight cConditional guifg=#669933  guibg=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
highlight cConstant guifg=#669933 guibg=NONE gui=NONE ctermfg=11 ctermbg=NONE cterm=NONE
highlight cCppOutWrapper guifg=#fc580c guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight cDefine guifg=#ffc48c guibg=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
highlight cInclude guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=149 ctermbg=NONE cterm=NONE
highlight cLabel guifg=#669933  guibg=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
highlight cNumber guifg=#f38630 guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight cOctal guifg=#f38630 guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight cOctalZero guifg=#fc580c guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight cOperator guifg=#669933  guibg=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
highlight cPreCondit guifg=#fc580c guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight cRepeat guifg=#669933  guibg=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
highlight cSpecial guifg=#cb4b16 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight cSpecialCharacter guifg=#cb4b16 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight cStatement guifg=#669933  guibg=NONE gui=NONE ctermfg=65 ctermbg=NONE cterm=NONE
highlight cStorageClass guifg=#669933  guibg=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
highlight cString guifg=#ffff99 guibg=NONE gui=NONE ctermfg=229 ctermbg=NONE cterm=NONE
highlight cStructure guifg=#669933  guibg=NONE gui=NONE ctermfg=65 ctermbg=NONE cterm=NONE
highlight cType guifg=#aee239 guibg=NONE gui=NONE ctermfg=149 ctermbg=NONE cterm=NONE
highlight cppType guifg=#aee239 guibg=NONE gui=NONE ctermfg=149 ctermbg=NONE cterm=NONE

" - Elm -
highlight elmConditional guifg=#ccff99 guibg=NONE gui=NONE ctermfg=229 ctermbg=NONE cterm=NONE
highlight elmLetBlockDefinition guifg=#ffc48c guibg=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
highlight elmCaseBlockDefinition guifg=#ffc48c guibg=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
highlight elmTypedef guifg=#88bb55 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight elmAlias guifg=#88bb55 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight elmTopLevelDecl guifg=#fc580c guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight elmImport guifg=#f38630 guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight elmTopLevelFunction guifg=#88bb55 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight elmType guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=149 ctermbg=NONE cterm=NONE
highlight elmDelimiter guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=149 ctermbg=NONE cterm=NONE
highlight elmBraces guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=149 ctermbg=NONE cterm=NONE
highlight elmOperator guifg=#f38630 guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight elmString guifg=#f5e28e guibg=NONE gui=NONE ctermfg=11 ctermbg=NONE cterm=NONE


" - Lisp -
highlight lispEscapeSpecial guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE

" - Rest/rst -
highlight rstEmphasis guifg=#ffff99 guibg=NONE gui=NONE ctermfg=229 ctermbg=NONE cterm=NONE
highlight rstStrongEmphasis guifg=#ffff99 guibg=NONE gui=NONE ctermfg=229 ctermbg=NONE cterm=NONE

" - JavaScript -
"
highlight jsString guifg=#fff1a0 guibg=NONE gui=NONE ctermfg=183 ctermbg=NONE cterm=NONE
highlight jsSpreadOperator guifg=#fff1a0 guibg=NONE gui=NONE ctermfg=183 ctermbg=NONE cterm=NONE
highlight jsExtendsKeyword guifg=#ff8787 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsOperatorKeyword guifg=#ff8787 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsClassKeyword guifg=#ff8787 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsStorageClass guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsConditional guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsRepeat guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsString guifg=#fff1a0 guibg=NONE gui=NONE ctermfg=183 ctermbg=NONE cterm=NONE
highlight jsOperator guifg=#ffffff guibg=NONE gui=NONE ctermfg=231 ctermbg=NONE cterm=NONE
highlight jsTernaryIfOperator guifg=#ffffff guibg=NONE gui=NONE ctermfg=231 ctermbg=NONE cterm=NONE
highlight jsReturn guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsExport guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsExportDefault guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsImport guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsTry guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsCatch guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsFrom guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsDo guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsFunction guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsLabel guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsClassMethodType guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsThis guifg=#7adffd guibg=NONE gui=NONE ctermfg=50 ctermbg=NONE cterm=NONE
highlight jsFuncName guifg=#dfafff guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
highlight jsException guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight jsObjectFuncName guifg=#dfafff guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
highlight jsArrowFunction guifg=#dfafff guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
highlight jsComment guifg=#696363 guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
highlight jsFuncCall guifg=#e6b52e guibg=NONE gui=NONE ctermfg=183 ctermbg=NONE cterm=NONE
highlight jsFuncArgs guifg=#ffbecb guibg=NONE gui=NONE ctermfg=217 ctermbg=NONE cterm=NONE
highlight jsSpecial guifg=#e9890d guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight jsRegexpString guifg=#e9890d guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight jsRegexpOr guifg=#e9890d guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight jsRegexpCharClass guifg=#e9890d guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight jsRegexpQuantifier guifg=#e9890d guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight jsConstant guifg=#ef9090 guibg=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
highlight jsNull guifg=#ef9090 guibg=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE

" - Vue.js -
highlight vueTemplateTag guifg=#fc580c guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight vueStyleTag guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight vueScriptTag guifg=#df87df guibg=NONE gui=NONE ctermfg=176 ctermbg=NONE cterm=NONE
highlight vueDirective guifg=#df87df guibg=NONE gui=NONE ctermfg=176 ctermbg=NONE cterm=NONE
highlight vueEvent guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE

" - Svelte.js -
highlight svelteConditional guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight svelteRepeat guifg=#df87df guibg=NONE gui=NONE ctermfg=176 cterm=NONE

" - TypeScript -
highlight typeScriptAjaxObjects guifg=#fc580c guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight typeScriptBoolean guifg=#c491c4 guibg=NONE gui=NONE ctermfg=176 ctermbg=NONE cterm=NONE
highlight typeScriptBraces guifg=#f8f8f0 guibg=NONE gui=NONE ctermfg=231 ctermbg=NONE cterm=NONE
highlight typeScriptBranch guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight typeScriptComment guifg=#696363 guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
highlight typeScriptConditional guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight typeScriptEndColons guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight typeScriptException guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight typeScriptFunction guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight typeScriptFuncKeyword guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight typeScriptGlobal guifg=#fc580c guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight typeScriptIdentifier guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight typeScriptLabel guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight typeScriptLineComment guifg=#696363 guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
highlight typeScriptMember guifg=#fc580c guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight typeScriptMessage guifg=#ffffff guibg=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
highlight typeScriptNull guifg=#fc580c guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight typeScriptNumber guifg=#fc580c guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight typeScriptOpSymbols guifg=#f8f8f0 guibg=NONE gui=NONE ctermfg=231 ctermbg=NONE cterm=NONE
highlight typeScriptOperator guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight typeScriptParens guifg=#f8f8f0 guibg=NONE gui=NONE ctermfg=231 ctermbg=NONE cterm=NONE
highlight typeScriptRepeat guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight typeScriptReserved guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight typeScriptSpecial guifg=#f8f8f0 guibg=NONE gui=NONE ctermfg=231 ctermbg=NONE cterm=NONE
highlight typeScriptSpecialCharacter guifg=#f8f8f0 guibg=NONE gui=NONE ctermfg=231 ctermbg=NONE cterm=NONE
highlight typeScriptStatement guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight typeScriptStringD guifg=#fdca49 guibg=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
highlight typeScriptStringS guifg=#fdca49 guibg=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
highlight typeScriptStringT guifg=#fd971f guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight typeScriptThis guifg=#ffff99 guibg=NONE gui=NONE ctermfg=229 ctermbg=NONE cterm=NONE
highlight typeScriptType guifg=#fd971f guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE


" - AngularJS -
" in HTML
highlight angularMarker guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE 
highlight angularDirective guifg=#dfafff guibg=NONE gui=NONE ctermfg=183 ctermbg=NONE cterm=NONE
highlight angularUIDirective guifg=#dfafff guibg=NONE gui=NONE ctermfg=183 ctermbg=NONE cterm=NONE
highlight angularVariable guifg=#ffffff guibg=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
" in JavaScript
highlight angularScope guifg=#5aede0 guibg=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE
highlight angularService guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE


" Python
highlight pythonBuiltin guifg=#f5e28e guibg=NONE gui=NONE ctermfg=11 ctermbg=NONE cterm=NONE
highlight pythonConst guifg=#fd971f guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight pythonClass guifg=#f5c264 guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
highlight pythonComment guifg=#556270 guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
highlight pythonConditional guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight pythonDecorator guifg=#fd971f guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight pythonDecoratorName guifg=#fdd9ae guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight pythonDocString guifg=#556270 guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
highlight pythonEscape guifg=#fd971f guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight pythonException guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight pythonExceptions guifg=#fdca49 guibg=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
highlight pythonFunction guifg=#f8f8f0 guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
highlight pythonInclude guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight pythonNumber guifg=#fc580c guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight pythonOperator guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight pythonRawString guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight pythonRepeat guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight pythonSelf guifg=#7adffd guibg=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE
highlight pythonStatement guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight pythonString guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight pythonUnderUnder guifg=#fd971f guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE


" - Rust -
highlight rustArrowCharacter guifg=#f5f5f5 guibg=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
highlight rustAssert guifg=#fdd9ae guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight rustAsync guifg=#b48ead guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight rustAttribute guifg=#d08770 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight rustBoolean guifg=#a3be8c guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight rustCharacter guifg=#ebcb8b guibg=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
highlight rustCommentLineDoc guifg=#586e75 guibg=NONE gui=NONE ctermfg=241 ctermbg=NONE cterm=NONE
highlight rustConditional guifg=#7ab6e8 guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight rustDerive guifg=#fdd9ae guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight rustDeriveTrait guifg=#fdf088 guibg=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE
highlight rustDynKeyword guifg=#fdd9ae guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight rustEnumVariant guifg=#d08770 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight rustEscape guifg=#d08770 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight rustFuncCall guifg=#ffffff guibg=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
highlight rustFuncName guifg=#ffffff guibg=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
highlight rustIdentifier guifg=#ffffff guibg=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
highlight rustKeyword guifg=#5e81ac guibg=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
highlight rustMacro guifg=#fdd9ae guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight rustMacroVariable guifg=#ff8770 guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight rustModPath guifg=#f0f0f0 guibg=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
highlight rustModPathSep guifg=#ffffff guibg=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
highlight rustNumber guifg=#ff8770 guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight rustOperator guifg=#ffffff guibg=NONE gui=NONE ctermfg=147 ctermbg=NONE cterm=NONE
highlight rustQuestionMark guifg=#ff8770 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight rustRepeat guifg=#7ab6e8 guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight rustSelf guifg=#9fccbb guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight rustSigil guifg=#ff8770 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight rustStorage guifg=#b48ead guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight rustPanic guifg=#f4bedd guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight rustString guifg=#fbdb8b guibg=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
highlight rustStringDelimiter guifg=#fbdb8b guibg=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
highlight rustStructure guifg=#5e81ac guibg=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
highlight rustTrait guifg=#a1c1e1 guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight rustType guifg=#d08770 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight rustTypedef guifg=#5e81ac guibg=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
highlight rustUnsafeKeyword guifg=#ff8770 guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE

" Iceberg
" red      #D47D7B
" green    #b6bd89
" orange   #d9a57e
" blue     #89a0c3
" purple   #9d94c3
" cyan     #92b7c1

" - Nim -
highlight nimKeyword guifg=#7ab6e8 guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight nimRepeat guifg=#7ab6e8 guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight nimConditional guifg=#7ab6e8 guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight nimOperator guifg=#fdf088 guibg=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE
highlight nimBuiltin guifg=#ffcc69 guibg=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
highlight nimSpecialVar guifg=#b48ead guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight nimNumber guifg=#ff8770 guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight nimSelf guifg=#b48ead guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight nimString guifg=#fdd9ae guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight nimFunction guifg=#ffffff guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
highlight nimBoolean guifg=#a3be8c guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE
highlight nimPragma guifg=#a1c1e1 guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight nimAsync guifg=#ffaaaa guibg=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
highlight nimBle guifg=#d08770 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight nimUnittest guifg=#86b953 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE


" - HTML
highlight htmlComment guifg=#556270 guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
highlight htmlCommentPart guifg=#556270 guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
highlight htmlTagName guifg=#f38630 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight htmlEndTag guifg=#f38630 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight htmlTag guifg=#f38630 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight htmlTagN guifg=#f38630 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight htmlArg guifg=#fdca49 guibg=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
highlight htmlString guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight htmlSpecialTagName guifg=#f2592a guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight htmlLink guifg=#ffffff guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
highlight htmlTitle guifg=#ffffff guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
highlight htmlH1 guifg=#ffffff guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
highlight htmlH2 guifg=#ffffff guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
highlight htmlH3 guifg=#ffffff guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
highlight htmlH4 guifg=#ffffff guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
highlight htmlH5 guifg=#ffffff guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
highlight htmlH6 guifg=#ffffff guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
highlight htmlSpecialChar guifg=#ffc48c guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE

" - PostgreSQL
highlight sqlConstant guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight sqlNumber guifg=#ffaaaa guibg=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
highlight sqlType guifg=#ffc48c guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight sqlString guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight sqlFlow guifg=#fdca49 guibg=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
highlight sqlStatement guifg=#f38630 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight sqlKeyword guifg=#f38630 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight sqlOperator guifg=#f38630 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight sqlPlpgsqlKeyword guifg=#f38630 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight sqlOperator guifg=#ffffff guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
highlight pgPostgresDelim guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE
highlight pgPostgresVariable guifg=#5f8700 guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE
" - Overwrites
highlight pgPublicSchema guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE
highlight pgBoolean guifg=#ffaaaa guibg=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
highlight pgUnreserved guifg=#c7cadf guibg=#000510 gui=NONE ctermfg=253 ctermbg=233 cterm=NONE
" - PostgreSQL Mako -
highlight pgMakoDelim guifg=#0095ff guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE
highlight pgMakoEnd guifg=#0095ff guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE
highlight pgPhpRegion guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE


" - XML -
highlight xmlAttrib guifg=#fdca49 guibg=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
highlight xmlString guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight xmlTagName guifg=#f38630 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight xmlTag guifg=#f38630 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight xmlEndTag guifg=#f38630 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight xmlEqual guifg=#f38630 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE

" - Mako -
highlight makoComment guifg=#556270 guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
highlight makoDelim guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE
highlight makoEnd guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE
highlight makoAttributeKey guifg=#5aede0 guibg=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE
highlight makoAttributeValue guifg=#bbffff guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE

" - Django -
highlight djangoTagBlock guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE
highlight djangoVarBlock guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE
highlight djangoStatement guifg=#5aede0 guibg=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE
highlight djangoFilter guifg=#5aede0 guibg=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE
highlight djangoArgument guifg=#bbffff guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE

" - Blade -
highlight bladeConditional guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE
highlight bladeKeyword guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE
highlight bladeEchoDelim guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE
highlight bladeParen guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE
highlight bladeStructure guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE

" - PHP -
highlight phpBoolean guifg=#f2592a guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight phpBackslashSequences guifg=#f2592a guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight phpComparison guifg=#f8f8f0 guibg=NONE gui=NONE ctermfg=231 ctermbg=NONE cterm=NONE
highlight phpConditional guifg=#7ab6e8 guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight phpLabel guifg=#7ab6e8 guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight phpException guifg=#7ab6e8 guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight phpStatement guifg=#7ab6e8 guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight phpRepeat guifg=#7ab6e8 guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight phpKeyword guifg=#7ab6e8 guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE
highlight phpDefine guifg=#697eb3 guibg=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
highlight phpStructure guifg=#697eb3 guibg=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
highlight phpConstant guifg=#697eb3 guibg=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
highlight phpCoreConstant guifg=#697eb3 guibg=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
highlight phpFunctions guifg=#af7f99 guibg=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
highlight phpSpecialFunction guifg=#f5e28e guibg=NONE gui=NONE ctermfg=11 ctermbg=NONE cterm=NONE
highlight phpIdentifier guifg=#f8f8f0 guibg=NONE gui=NONE ctermfg=231 ctermbg=NONE cterm=NONE
highlight phpMemberSelector guifg=#f8f8f0 guibg=NONE gui=NONE ctermfg=231 ctermbg=NONE cterm=NONE
highlight phpMethods guifg=#f8f8f0 guibg=NONE gui=NONE ctermfg=231 ctermbg=NONE cterm=NONE
highlight phpNumber guifg=#f2592a guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight phpOperator guifg=#f8f8f0 guibg=NONE gui=NONE ctermfg=231 ctermbg=NONE cterm=NONE
highlight phpAssignByRef guifg=#f8f8f0 guibg=NONE gui=NONE ctermfg=231 ctermbg=NONE cterm=NONE
highlight phpParent guifg=#f8f8f0 guibg=NONE gui=NONE ctermfg=231 ctermbg=NONE cterm=NONE
highlight phpRelation guifg=#f8f8f0 guibg=NONE gui=NONE ctermfg=231 ctermbg=NONE cterm=NONE
highlight phpRegion guifg=#c2dcf2 guibg=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
highlight phpStorageClass guifg=#617fa0 guibg=NONE gui=NONE ctermfg=67 ctermbg=NONE cterm=NONE
highlight phpInclude guifg=#617fa0 guibg=NONE gui=NONE ctermfg=67 ctermbg=NONE cterm=NONE
highlight phpStringBacktick guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight phpStringDouble guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight phpStringSingle guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight phpType guifg=#f38630 guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight phpVarSelector guifg=#f8f8f0 guibg=NONE gui=NONE ctermfg=231 ctermbg=NONE cterm=NONE
highlight phpDocTags guifg=#98aeb5 guibg=NONE gui=NONE ctermfg=241 ctermbg=NONE cterm=NONE
highlight phpCommentTitle guifg=#98aeb5 guibg=NONE gui=NONE ctermfg=241 ctermbg=NONE cterm=NONE
highlight phpDocParam guifg=#95c2e8 guibg=NONE gui=NONE ctermfg=110 ctermbg=NONE cterm=NONE

" - Clojure -
highlight clojureString guifg=#5f8700 guibg=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
highlight clojureMacro guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight clojureKeyword guifg=#ff875f guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight clojureDefine guifg=#ff8700 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight clojureSpecial guifg=#ff8700 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight clojureFunc guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight clojureCond guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight clojureParen  guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight clojureConstant guifg=#f2592a guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight clojureCharacter guifg=#af5f00 guibg=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
highlight clojureStringEscape guifg=#f2592a guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight clojureBoolean guifg=#f2592a guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight clojureVariable guifg=#ff8700 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight clojureException guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight clojureRepeat guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight clojureSymbol guifg=#feee19 guibg=NONE gui=NONE ctermfg=229 ctermbg=NONE cterm=NONE
highlight clojureNumber guifg=#f2592a guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE

" - Hy -
highlight hyParen  guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight hyDefine guifg=#ff8700 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight hySpecial guifg=#ff8700 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight hyFunc guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight hyNumber guifg=#f2592a guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight hyString guifg=#5f8700 guibg=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
highlight hySymbol guifg=#feee19 guibg=NONE gui=NONE ctermfg=229 ctermbg=NONE cterm=NONE

" - Go -
highlight goString guifg=#feee19 guibg=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
highlight goRawString guifg=#669933 guibg=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
highlight goDecimalInt guifg=#f2592a guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight goFloat guifg=#f2592a guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight goConstants guifg=#f2592a guibg=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
highlight goDirective guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight goDeclaration guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight goRepeat guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight goConditional guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight goLabel guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight goStatement guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight goBuiltins guifg=#f38630 guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight goType guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight goDeclType guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight goSignedInts guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight goExtraType guifg=#DC322F guisp=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE

" - CSS -
highlight cssAuralAttr guifg=#aee239 guibg=NONE gui=NONE ctermfg=36 ctermbg=NONE cterm=NONE
highlight cssAttributeSelector guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=107 ctermbg=NONE cterm=NONE
highlight cssBackgroundAttr guifg=#dfafff guibg=NONE gui=NONE ctermfg=183 ctermbg=NONE cterm=NONE
highlight cssBackgroundProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight cssBorderAttr guifg=#dfafff guibg=NONE gui=NONE ctermfg=183 ctermbg=NONE cterm=NONE
highlight cssBorderProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight cssBorderOutlineAttr guifg=#aee239 guibg=NONE gui=NONE ctermfg=36 ctermbg=NONE cterm=NONE
highlight cssBorderOutlineProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight cssBoxAttr guifg=#aee239 guibg=NONE gui=NONE ctermfg=36 ctermbg=NONE cterm=NONE
highlight cssBoxProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight cssBraces guifg=#ffffff guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
highlight cssClassName guifg=#69d2e7 guibg=NONE gui=NONE ctermfg=79 ctermbg=NONE cterm=NONE
highlight cssClassNameDot guifg=#69d2e7 guibg=NONE gui=NONE ctermfg=79 ctermbg=NONE cterm=NONE
highlight cssColor guifg=#f38630 guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight cssColorAttr guifg=#aee239 guibg=NONE gui=NONE ctermfg=36 ctermbg=NONE cterm=NONE
highlight cssColorProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight cssComment guifg=#505c63 guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
highlight cssCommonAttr guifg=#aee239 guibg=NONE gui=NONE ctermfg=36 ctermbg=NONE cterm=NONE
highlight cssDimensionProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight cssFontAttr guifg=#aee239 guibg=NONE gui=NONE ctermfg=36 ctermbg=NONE cterm=NONE
highlight cssFontDescriptorAttr guifg=#aee239 guibg=NONE gui=NONE ctermfg=36 ctermbg=NONE cterm=NONE
highlight cssFontProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight cssGeneratedContentAttr guifg=#aee239 guibg=NONE gui=NONE ctermfg=36 ctermbg=NONE cterm=NONE
highlight cssGeneratedContentProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=87 ctermbg=NONE cterm=NONE
highlight cssIdentifier guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight cssIncludeKeyword guifg=#fdca49 guibg=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
highlight cssMarginProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight cssMediaProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight cssPaddingProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight cssPageProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight cssPositioningAttr guifg=#aee239 guibg=NONE gui=NONE ctermfg=36 ctermbg=NONE cterm=NONE
highlight cssPositioningProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight cssPseudoClass guifg=#fdca49 guibg=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
highlight cssPseudoClassId guifg=#fdca49 guibg=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
highlight cssRenderAttr guifg=#aee239 guibg=NONE gui=NONE ctermfg=36 ctermbg=NONE cterm=NONE
highlight cssRenderProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight cssStringQ guifg=#ccff99 guibg=NONE gui=NONE ctermfg=191 ctermbg=NONE cterm=NONE
highlight cssStringQQ guifg=#ccff99 guibg=NONE gui=NONE gui=NONE ctermfg=191 ctermbg=NONE cterm=NONE
highlight cssTableAttr guifg=#aee239 guibg=NONE gui=NONE ctermfg=36 ctermbg=NONE cterm=NONE
highlight cssTableProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight cssTagName guifg=#f2592a guibg=NONE gui=NONE ctermfg=166 ctermbg=NONE cterm=NONE
highlight cssTextAttr guifg=#aee239 guibg=NONE gui=NONE ctermfg=36 ctermbg=NONE cterm=NONE
highlight cssTextProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight cssUnitDecorators guifg=#f38630 guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight cssUIAttr guifg=#aee239 guibg=NONE gui=NONE ctermfg=36 ctermbg=NONE cterm=NONE
highlight cssUIProp guifg=#a7dbd8 guibg=NONE gui=NONE ctermfg=159 ctermbg=NONE cterm=NONE
highlight cssURL guifg=#ffbb29 guibg=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
highlight cssValueLength guifg=#f38630 guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight cssValueNumber guifg=#f38630 guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight cssVendor guifg=#fdca49 guibg=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE

" - Less -
highlight lessComment guifg=#505c63 guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
highlight lessImport guifg=#669933 guibg=NONE gui=NONE ctermfg=11 ctermbg=NONE cterm=NONE
highlight lessVariable guifg=#d5dbb6 guibg=NONE gui=NONE ctermfg=193 ctermbg=NONE cterm=NONE
highlight lessFunction guifg=#fdca49 guibg=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
highlight lessNestedSelector guifg=#fdca49 guibg=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
highlight lessClass guifg=#69d2e7 guibg=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE
highlight lessVariableValue guifg=#f38630 guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE

" - Sass -
highlight sassAmpersand guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight scssComment guifg=#505c63 guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
highlight sassIdChar guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight sassId guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight sassClassChar guifg=#69d2e7 guibg=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE
highlight sassClass guifg=#69d2e7 guibg=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE
highlight sassMixin guifg=#fdca49 guibg=NONE gui=NONE ctermfg=226 ctermbg=NONE cterm=NONE
highlight sassInclude guifg=#669933 guibg=NONE gui=NONE ctermfg=65 ctermbg=NONE cterm=NONE
highlight sassVariable guifg=#d5dbb6 guibg=NONE gui=NONE ctermfg=193 ctermbg=NONE cterm=NONE

" - Toml -
highlight tomlTable guifg=#ff5f87 guibg=NONE gui=NONE ctermfg=204 ctermbg=NONE cterm=NONE
highlight tomlTableArray guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight tomlInteger guifg=#f2592a guibg=NONE gui=NONE ctermfg=166 ctermbg=NONE cterm=NONE
highlight tomlFloat guifg=#f2592a guibg=NONE gui=NONE ctermfg=166 ctermbg=NONE cterm=NONE
highlight tomlString guifg=#fdca49 guibg=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
highlight tomlBoolean guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE

" - fugitive -
highlight fugitiveHeading guifg=#f2592a guibg=NONE gui=NONE ctermfg=166 ctermbg=NONE cterm=NONE
highlight fugitiveHeader guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight fugitiveModifier guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight fugitiveCount guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE

" - git messenger
hi gitmessengerPopupNormal term=None guifg=#c7cadf guibg=#1a1d2a ctermfg=255 ctermbg=234

" - git -
highlight gitCommitSelectedType guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight gitCommitHeader guifg=#f2592a guibg=NONE gui=NONE ctermfg=166 ctermbg=NONE cterm=NONE
highlight gitCommitSelectedFile guifg=#fdca49 guibg=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE

" - VimL -
highlight vimHiGui guifg=#5aede0 guibg=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE
highlight vimHiGuiFgBg guifg=#5aede0 guibg=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE
highlight vimHiCterm guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight vimHiCtermFgBg guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight vimOnlyOption guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight vimTermOption guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE

" NERDTree
highlight NERDTreeHelp guifg=#505c63 guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=inverse,bold
highlight NERDTreeDir guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight NERDTreeDirSlash guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight NERDTreeCWD guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight NERDTreeUp guifg=#fd971f guibg=NONE gui=italic ctermfg=208 ctermbg=NONE cterm=NONE
highlight NERDTreeLinkFile guifg=#4ecdc4 guibg=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE
highlight NERDTreeLinkTarget guifg=#fd971f guibg=NONE gui=italic ctermfg=208 ctermbg=NONE cterm=NONE
highlight NERDTreeExecFile guifg=#aee239 guibg=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE
highlight NERDTreeOpenable guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE
highlight NERDTreeClosable guifg=#01a8c6 guibg=NONE gui=NONE ctermfg=38 ctermbg=NONE cterm=NONE

" - TagBar -
highlight TagbarComment guifg=#505c63 guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=inverse,bold
highlight TagbarScope guifg=#4ecdc4 guibg=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE
highlight TagbarType guifg=#fd971f guibg=NONE gui=italic ctermfg=208 ctermbg=NONE cterm=NONE
highlight TagbarKind guifg=#fd971f guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
highlight TagbarNestedKind guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
highlight TagbarFoldIcon guifg=#8fbe00 guibg=NONE gui=NONE ctermfg=106 ctermbg=NONE cterm=NONE
