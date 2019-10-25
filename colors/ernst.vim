" Vim color file
" Maintainer:   Thomas Ernst <thomas.ernst@ebenefuenf.de>

"set background=light
hi clear
if exists('syntax_on')
	syntax reset
endif

set background=dark
let colors_name = "ernst"

highlight Normal                        gui=None        guifg=#ffffff   ctermfg=15  guibg=#252525
highlight Folded                        gui=italic      guifg=#454545               guibg=#323232
highlight Cursorline                    gui=None                                    guibg=#323232  cterm=NONE ctermbg=235
highlight CursorLineNr                  gui=None        guifg=#fff000
highlight Visual                        gui=None        guibg=#336ace   ctermbg=27                         

highlight Boolean                       gui=None        guifg=#ff6666   ctermfg=203                            
highlight Character                     gui=None        guifg=#d7afaf   ctermfg=131                               
highlight Comment                       gui=italic      guifg=#777777   ctermfg=243                 
highlight Conditional                   gui=None        guifg=#ff9900   ctermfg=172                               
highlight Constant                      gui=None        guifg=#99da00                               
highlight Cursor                        gui=None        guifg=#ffffff   ctermfg=15  guibg=#dd0000   ctermbg=9   
highlight iCursor                       gui=None        guifg=#1c1c1c               guibg=#ffffff   
highlight Debug                         gui=None        guifg=#d7afaf   ctermfg=131                               
highlight Define                        gui=None        guifg=#ff9900   ctermfg=172                               
highlight Delimiter                     gui=None        guifg=#ffffff   ctermfg=15            
highlight DiffAdd                       gui=None        guifg=#c1d3b1               guibg=#485b39   
highlight DiffChange                    gui=None        guifg=#485b39               guibg=#c1d3b1   
highlight DiffDelete                    gui=None        guifg=#c47b7b               guibg=#934242   
highlight DiffText                      gui=None        guifg=#934242               guibg=#f9c2c2   
highlight Directory                     gui=None        guifg=#63ccff                               
highlight Error                         gui=None        guifg=#ffffff   ctermfg=15  guibg=#ff9900   
highlight ErrorMsg                      gui=None        guifg=#87d7af                               
highlight Exception                     gui=None        guifg=#b2b2b2                               
highlight SignColumn                    gui=None        guifg=#777777               guibg=#111111
highlight FoldColumn                    gui=None        guifg=#777777               guibg=#202020
highlight Float                         gui=None        guifg=#ff0000                               
highlight Function                      gui=None        guifg=#ffcc99   ctermfg=215                             
highlight Identifier                    gui=None        guifg=#ffff99   ctermfg=228                              
highlight IncSearch                     gui=None        guifg=#ffffff   ctermfg=28   guibg=#008700 ctermbg=0
highlight Include                       gui=None        guifg=#ff9900   ctermfg=172                               
highlight Keyword                       gui=None        guifg=#ffffff   ctermfg=15                  
highlight Label                         gui=None        guifg=#ff00ff   ctermfg=201                               
highlight LineNr                        gui=None        guifg=#777777   ctermfg=243 guibg=#111111   ctermbg=232
highlight Macro                         gui=None        guifg=#ff2222   ctermfg=196                                          " e.g. PHP tags
highlight MatchParen                    gui=None        guifg=#ffff00   guibg=#151515    ctermfg=208  ctermbg=None 
highlight ModeMsg                       gui=None        guifg=#ffd7af                               
highlight MoreMsg                       gui=None        guifg=#ffffff   ctermfg=15                  
highlight NonText                       gui=None        guifg=#444444                               
highlight Number                        gui=None        guifg=#ff5555   ctermfg=203                               
highlight Operator                      gui=None        guifg=#ffffff   ctermfg=15                  
highlight Pmenu                         gui=None        guifg=#000000   ctermfg=0   guibg=Darkgray  
highlight PmenuSel                      gui=None        guifg=#000000   ctermfg=0   guibg=Gray      
highlight PreCondit                     gui=None        guifg=#d7af87                           " Autocomplete
highlight PreProc                       gui=None        guifg=#ffd7af                               
highlight Question                      gui=None        guifg=#ffffff   ctermfg=15                  
highlight Region                        gui=None        guifg=#ff0000                               
highlight Repeat                        gui=None        guifg=#ff9900   ctermfg=172                               
highlight Search                        gui=None        guifg=#000000   ctermfg=0   guibg=#aaaa00   ctermbg=184
highlight SpecialChar                   gui=None        guifg=#d7afaf   ctermfg=131                               
highlight SpecialComment                gui=None        guifg=#87af87                               
highlight Special                       gui=None        guifg=#ffffff   ctermfg=15                  
highlight SpecialKey                    gui=None        guifg=#afd7af                               
highlight SpellBad                      gui=undercurl   guifg=#ff0000               ctermbg=52
highlight SpellCap                      gui=undercurl   guifg=#ff8800               ctermbg=52
highlight Statement                     gui=None        guifg=#fce94f   ctermfg=172                               
highlight StatusLine                    gui=None        guifg=#ffff11               guibg=black     
highlight StatusLineNC                  gui=None        guifg=#dddddd               guibg=black     
highlight StorageClass                  gui=None        guifg=#ffcc99   ctermfg=215                            
highlight String                        gui=None        guifg=#beff32   ctermfg=148
highlight Structure                     gui=None        guifg=#ff9900   ctermfg=172      " Classes                
highlight TabLineFill                   gui=None        guifg=#000000   guibg=White      
highlight TabLine                       gui=bold        guifg=#0087af   guibg=#86d6fd    ctermfg=25          ctermbg=45
highlight TabLineSel                    gui=bold        guifg=#ffffff   guibg=#0087af    ctermfg=White       ctermbg=25
highlight TabLineMod                    gui=bold        guifg=#ff0000   guibg=#86d6fd    ctermfg=Red         ctermbg=45
highlight TabLineModSel                 gui=bold        guifg=#ff0000   guibg=#0087af    ctermfg=Red         ctermbg=25
highlight Tag                           gui=None        guifg=#ffff00   ctermfg=11
highlight Title                         gui=None        guifg=#ffffff    ctermfg=15                  
highlight Todo                          gui=None        guifg=#afd7ff               guibg=#1c1c1c   
highlight Typedef                       gui=None        guifg=#dadada                               
highlight Type                          gui=None        guifg=#d7d7af   ctermfg=229                              
highlight Underlined                    gui=None        guifg=#d7d7d7                               
highlight VertSplit                     gui=None        guifg=#505050   ctermfg=235    ctermbg=237
highlight VisualNOS                     gui=None        guifg=#303030                               
highlight WarningMsg                    gui=None        guifg=#ffffff   ctermfg=15                  
" - PHP -                                                                                           
highlight phpSpecialFunction            gui=None        guifg=#ffcc99   ctermfg=215
highlight phpClass                      gui=None        guifg=#ff00ff   ctermfg=201                               
" - JavaScript -
highlight javaScriptConditional         gui=None        guifg=#ff99cc   ctermfg=211
highlight javaScriptRepeat              gui=None        guifg=#ff99cc   ctermfg=211
highlight javaScriptStatement           gui=None        guifg=#ff99cc   ctermfg=211
highlight javaScriptIdentifier          gui=None        guifg=#ff99cc   ctermfg=211
highlight javaScriptException           gui=None        guifg=#ff99cc   ctermfg=211
highlight javaScriptFunction            gui=None        guifg=#ff99cc   ctermfg=211
highlight javaScriptIdentifier          gui=None        guifg=#ff99cc   ctermfg=211
highlight javaScriptParens              gui=None        guifg=#ffffff   ctermfg=15
highlight javaScriptBraces              gui=None        guifg=#ffffff   ctermfg=15
highlight javaScriptStatement           gui=None        guifg=#ff99cc   ctermfg=211
highlight javaScriptSpecial             gui=None        guifg=#ffffff   ctermfg=15
highlight javaScriptSpecialCharacter    gui=None        guifg=#ffffff   ctermfg=15
highlight javaScriptStringD             gui=None        guifg=#ffff99   ctermfg=228
highlight javaScriptStringS             gui=None        guifg=#ffff99   ctermfg=228
highlight javaScriptThis                gui=None        guifg=#aff9ff   ctermfg=123
highlight javaScriptType                gui=None        guifg=#a9a9ff   ctermfg=104
highlight javaScriptNumber              gui=None        guifg=#ff5555   ctermfg=203
highlight coffeeKeyword                 gui=None        guifg=#ff99cc   ctermfg=211
highlight coffeeFunction                gui=None        guifg=#ff99cc   ctermfg=211
highlight coffeeException               gui=None        guifg=#ff99cc   ctermfg=211
highlight coffeeConditional             gui=None        guifg=#ff99cc   ctermfg=211
highlight coffeeRepeat                  gui=None        guifg=#ff99cc   ctermfg=211
highlight coffeeStatement               gui=None        guifg=#ff99cc   ctermfg=211
highlight coffeeBoolean                 gui=None        guifg=#7186ba   ctermfg=63
highlight coffeeGlobal                  gui=None        guifg=#ff5555   ctermfg=203
highlight coffeeSpecialVar              gui=None        guifg=#aff9ff   ctermfg=123
highlight coffeeString                  gui=None        guifg=#ffff99   ctermfg=228
highlight coffeeNumber                  gui=None        guifg=#ff5555   ctermfg=203
highlight coffeeFloat                   gui=None        guifg=#ff5555   ctermfg=203
highlight coffeeAssign                  gui=None        guifg=#ffffff   ctermfg=15
highlight coffeeObject                  gui=None        guifg=#a9a9ff   ctermfg=104
highlight coffeeConstant                gui=None        guifg=#a9a9ff   ctermfg=104
highlight coffeeAssignSymbols           gui=None        guifg=#ffffff   ctermfg=15
" Nur HTML
highlight htmlTagName                   gui=None        guifg=#ffff55   ctermfg=227
highlight htmlEndTag                    gui=None        guifg=#ffff55   ctermfg=227
highlight htmlTag                       gui=None        guifg=#ffff55   ctermfg=227
highlight htmlTagN                      gui=None        guifg=#ffff55   ctermfg=227
highlight htmlArg                       gui=None        guifg=#ffff99   ctermfg=229
highlight htmlString                    gui=None        guifg=#ffbb00   ctermfg=214
highlight htmlSpecialTagName            gui=None        guifg=#ff5555   ctermfg=87
" Nur Python
highlight pythonBuiltin                 gui=None        guifg=#ff99cc   ctermfg=175
highlight pythonBuiltinConst            gui=None        guifg=#bb99dd   ctermfg=140
highlight pythonConditional             gui=None        guifg=#63ccff   ctermfg=45
highlight pythonDecorator               gui=None        guifg=#ff9900   ctermfg=172             " Das @-Zeichen des Decorators                                      
highlight pythonDocString               gui=None        guifg=#777777   ctermfg=243
highlight pythonEscape                  gui=None        guifg=#ffaf00   ctermfg=214
highlight pythonException               gui=None        guifg=#63ccff   ctermfg=45
highlight pythonExceptions              gui=None        guifg=#ffff00   ctermfg=11
highlight pythonFunction                gui=None        guifg=#ffffff   ctermfg=15
highlight pythonInclude                 gui=None        guifg=#63ccff   ctermfg=45
highlight pythonNumber                  gui=None        guifg=#ff5555   ctermfg=203
highlight pythonOperator                gui=None        guifg=#63ccff   ctermfg=39
highlight pythonRawString               gui=None        guifg=#ffff99   ctermfg=229
highlight pythonRepeat                  gui=None        guifg=#63ccff   ctermfg=45
highlight pythonSelf                    gui=None        guifg=#bbffff   ctermfg=87
highlight pythonStatement               gui=None        guifg=#63ccff   ctermfg=45
highlight pythonString                  gui=None        guifg=#ffff99   ctermfg=229
highlight pythonUnderUnder              gui=None        guifg=#bb99dd   ctermfg=140
" Nur CSS
highlight cssTagName                    gui=None        guifg=#ff8800   ctermfg=172
highlight cssClassName                  gui=None        guifg=#ffdd33   ctermfg=215
highlight cssIdentifier                 gui=None        guifg=#ff5500   ctermfg=202
highlight cssURL                        gui=None        guifg=#ffbf00   ctermfg=214
highlight cssPseudoClass                gui=None        guifg=#ffff00   ctermfg=11
highlight cssPseudoClassId              gui=None        guifg=#ffff00   ctermfg=11
highlight cssBraces                     gui=None        guifg=#ffffff   ctermfg=15
highlight cssStringQ                    gui=None        guifg=#ccff99   ctermfg=15
highlight cssStringQQ                   gui=None        guifg=#ccff99   ctermfg=15
" Nur SASS
highlight scssIdChar                    gui=None        guifg=#ff6600   ctermfg=202
highlight scssId                        gui=None        guifg=#ff6600   ctermfg=202
highlight scssClassChar                 gui=None        guifg=#ffcc99   ctermfg=215
highlight scssClass                     gui=None        guifg=#ffcc99   ctermfg=215
highlight scssMixin                     gui=None        guifg=#ffff00   ctermfg=11
highlight scssInclude                   gui=None        guifg=#ffff00   ctermfg=11
highlight scssExclude                   gui=None        guifg=#ffff00   ctermfg=11
" Nur LESS
highlight lessImport                    gui=None        guifg=#669933   ctermfg=11
highlight lessVariable                  gui=None        guifg=#ffff99   ctermfg=229
highlight lessFunction                  gui=None        guifg=#ffff00   ctermfg=229
" Nur Mako
highlight makoDelim                     gui=None        guifg=#63ccff   ctermfg=39
highlight makoEnd                       gui=None        guifg=#63ccff   ctermfg=39
highlight makoAttributeKey              gui=None        guifg=#ff99cc   ctermfg=39
highlight makoAttributeValue            gui=None        guifg=#bbffff   ctermfg=39


" Nur Django Templates
highlight djangoTagBlock                gui=None        guifg=#bbffff   ctermfg=87
highlight djangoVarBlock                gui=None        guifg=#bbffff   ctermfg=87
highlight djangoComment                 gui=None        guifg=#bbffff   ctermfg=87
highlight djangoComBlock                gui=None        guifg=#bbffff   ctermfg=87
highlight djangoStatement               gui=None        guifg=#63ccff   ctermfg=39
highlight djangoFilter                  gui=None        guifg=#ff99cc   ctermfg=211
" Nur Jinja2 Templates
highlight jinjaTagBlock                 gui=None        guifg=#63ccff   ctermfg=39
highlight jinjaVarBlock                 gui=None        guifg=#63ccff   ctermfg=39
highlight jinjaComment                  gui=None        guifg=#bbffff   ctermfg=87
highlight jinjaStatement                gui=None        guifg=#bbffff   ctermfg=87
highlight jinjaFilter                   gui=None        guifg=#ff99cc   ctermfg=211
highlight jinjaVariable                 gui=None        guifg=#ff99cc   ctermfg=211
" highlight jinjaRaw                      gui=None        guifg=#63ccff   ctermfg=39
" highlight jinjaPunctuation
" highlight jinjaAttribute
" highlight jinjaFunction
" highlight jinjaTagDelim
" highlight jinjaVarDelim
" highlight jinjaCommentDelim
" highlight jinjaRawDelim
" highlight jinjaSpecial
" highlight jinjaOperator
" highlight jinjaRaw
" highlight jinjaBlockName
" highlight jinjaString
" highlight jinjaNumber

" Nur XML
highlight xmlTag                        gui=None        guifg=#ffbb00   ctermfg=214
highlight xmlTagName                    gui=None        guifg=#ffbb00   ctermfg=214
highlight xmlEndTag                     gui=None        guifg=#ffbb00   ctermfg=214
" Nur SQL
highlight sqlKeyword                    gui=None        guifg=#aaaadd   ctermfg=69
highlight sqlStatement                  gui=None        guifg=#aaaadd   ctermfg=69
highlight sqlString                     gui=None        guifg=#ffff99   ctermfg=228
highlight sqlOperator                   gui=None        guifg=#ff00ff   ctermfg=201
highlight sqlType                       gui=None        guifg=#88ffff   ctermfg=123
" NERDTree
highlight NERDTreeDir             gui=None        guifg=#63ccff   ctermfg=39
