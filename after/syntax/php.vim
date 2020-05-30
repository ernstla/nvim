" Vim syntax file
" Language:	PHP
" Maintainer:	Thomas Ernst <thomas.ernst@ebenefuenf.de>

" Overwrite defaults to include quotes
if exists("php_parent_error_open")
  syn region  phpStringDouble start=+"+ skip=+\\\\\|\\"+ end=+"+  contains=@phpAddStrings,phpBackslashSequences,phpBackslashDoubleQuote,@phpInterpDouble contained keepend
  syn region  phpBacktick start=+`+ skip=+\\\\\|\\"+ end=+`+  contains=@phpAddStrings,phpIdentifier,phpBackslashSequences,phpIdentifierSimply,phpIdentifierComplex contained keepend
  syn region  phpStringSingle start=+'+ skip=+\\\\\|\\'+ end=+'+  contains=@phpAddStrings,phpBackslashSingleQuote contained keepend
else
  syn region  phpStringDouble start=+"+ skip=+\\\\\|\\"+ end=+"+  contains=@phpAddStrings,phpBackslashSequences,phpBackslashDoubleQuote,@phpInterpDouble contained extend keepend
  syn region  phpBacktick start=+`+ skip=+\\\\\|\\"+ end=+`+  contains=@phpAddStrings,phpIdentifier,phpBackslashSequences,phpIdentifierSimply,phpIdentifierComplex contained extend keepend
  syn region  phpStringSingle start=+'+ skip=+\\\\\|\\'+ end=+'+  contains=@phpAddStrings,phpBackslashSingleQuote contained keepend extend
endif


" highlight php doc (from: https://github.com/tetsuo13/Vim-PHP-Doc)
syntax match phpCommentStar contained "^\s*\*[^/]"me=e-1
syntax match phpCommentStar contained "^\s*\*$"

syntax case ignore

syntax region phpDocComment start="/\*\*" end="\*/" keepend contains=phpCommentTitle,phpDocTags,phpTodo
syntax region phpCommentTitle contained matchgroup=phpDocComment start="/\*\*" matchgroup=phpCommmentTitle keepend end="\.$" end="\.[ \t\r<&]"me=e-1 end="[^{]@"me=s-2,he=s-1 end="\*/"me=s-1,he=s-1 contains=phpCommentStar,phpTodo,phpDocTags containedin=phpComment

syntax region phpDocTags start="{@\(example\|id\|internal\|inheritdoc\|link\|source\|toc\|tutorial\)" end="}" containedin=phpComment
syntax match phpDocTags "@\(abstract\|access\|author\|category\|copyright\|deprecated\|example\|final\|global\|ignore\|internal\|license\|link\|method\|name\|package\|param\|property\|return\|see\|since\|static\|staticvar\|subpackage\|throws\|todo\|tutorial\|uses\|var\|version\)\s\+\S\+" contains=phpDocParam containedin=phpComment
syntax match phpDocParam contained "\s\S\+"
syntax match phpDocTags "@filesource" containedin=phpComment

syn region phpRegionEcho matchgroup=Delimiter start="<?=" end="?>" contains=@phpClTop

syntax case match

highlight link phpCommentTitle SpecialComment
highlight link phpDocComment Comment
highlight link phpDocTags Special
highlight link phpDocParam Function
highlight link phpCommentStar Comment
highlight link phpRegionEcho Delimiter
