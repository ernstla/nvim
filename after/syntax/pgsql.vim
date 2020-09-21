syn case match
syn include @pgPythonTop syntax/python.vim
syn keyword pgMakoEnd contained endfor endwhile endif endtry enddef if elif not else

" Block rules
syn region pgMakoLine matchgroup=pgMakoDelim start=#^\s*%# end=#$# keepend contains=@pgPythonTop,pgMakoEnd
syn region pgMakoBlock matchgroup=pgMakoDelim start=#<%!\?# end=#%># keepend contains=@pgPythonTop,pgMakoEnd

" Variables
syn region pgMakoNested start="{" end="}" transparent display contained contains=pgMakoNested,@pgPythonTop
syn region pgMakoVariable matchgroup=pgMakoDelim start=#\${# end=#}# contains=pgMakoNested,@pgPythonTop
syn region pgPostgresVariable matchgroup=pgPostgresDelim start=#%(.\{-}# end=#)s#

" Comments
syn region pgMakoComment start="^\s*##" end="$"
syn region pgMakoDocComment matchgroup=pgMakoDelim start="<%doc>" end="</%doc>" keepend

" Literal Blocks
syn region pgMakoText matchgroup=pgMakoDelim start="<%text[^>]*>" end="</%text>"

" Attribute Sublexing
syn match pgMakoAttributeKey containedin=pgMakoTag contained "[a-zA-Z_][a-zA-Z0-9_]*="
syn region pgMakoAttributeValue containedin=pgMakoTag contained start=/"/ skip=/\\"/ end=/"/
syn region pgMakoAttributeValue containedin=pgMakoTag contained start=/'/ skip=/\\'/ end=/'/

" Tags
syn region pgMakoTag matchgroup=pgMakoDelim start="<%\(def\|call\|page\|include\|namespace\|inherit\|block\|[a-zA-Z_][a-zA-Z0-9_]*:[a-zA-Z_][a-zA-Z0-9_]*\)\>" end="/\?>"
syn match pgMakoDelim "</%\(def\|call\|namespace\|block\|[a-zA-Z_][a-zA-Z0-9_]*:[a-zA-Z_][a-zA-Z0-9_]*\)>"

" Newline Escapes
syn match pgMakoEscape /\\$/


syn region pgPhpRegion matchgroup=Delimiter start="<?php" end="?>" contains=@phpClTop

" The default public schema
syn keyword pgPublicSchema public
syn keyword pgBoolean true True TRUE false False FALSE
syn keyword pgUnreserved content locale path action comments comment superuser option options name value version edges data role

" Default highlighting links
if version >= 508 || !exists("did_pgmako_syn_inits")
  if version < 508
    let did_pgmako_syn_inits = 1
    com -nargs=+ HiLink hi link <args>
  else
    com -nargs=+ HiLink hi def link <args>
  endif

  HiLink pgMakoDocComment pgMakoComment
  HiLink pgMakoDefEnd pgMakoDelim

  HiLink pgMakoAttributeKey Type
  HiLink pgMakoAttributeValue String
  HiLink pgMakoText Normal
  HiLink pgMakoDelim Preproc
  HiLink pgMakoEnd Keyword
  HiLink pgMakoComment Comment
  HiLink pgMakoEscape Special

  delc HiLink
endif
