" Vim syntax file
" Language:	Javascript
" Maintainer:	Thomas Ernst <thomas.ernst@ebenefuenf.de>


syn keyword typeScriptThis      self this
syn region typeScriptStringT start=+`+ skip=+\\\\\|\\'+ end=+`\|$+  contains=typeScriptSpecial,@htmlPreproc

