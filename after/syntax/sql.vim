syn case match
syn include @sqlPythonTop syntax/python.vim
syn keyword sqlMakoEnd contained endfor endwhile endif endtry enddef if elif not else

" Block rules
syn region sqlMakoLine matchgroup=sqlMakoDelim start=#^\s*%# end=#$# keepend contains=@sqlPythonTop,sqlMakoEnd
syn region sqlMakoBlock matchgroup=sqlMakoDelim start=#<%!\?# end=#%># keepend contains=@sqlPythonTop,sqlMakoEnd

" Variables
syn region sqlMakoNested start="{" end="}" transparent display contained contains=sqlMakoNested,@sqlPythonTop
syn region sqlMakoVariable matchgroup=sqlMakoDelim start=#\${# end=#}# contains=sqlMakoNested,@sqlPythonTop
syn region sqlPostgresVariable matchgroup=sqlPostgresDelim start=#%(.\{-}# end=#)s#

" Comments
syn region sqlMakoComment start="^\s*##" end="$"
syn region sqlMakoDocComment matchgroup=sqlMakoDelim start="<%doc>" end="</%doc>" keepend

" Literal Blocks
syn region sqlMakoText matchgroup=sqlMakoDelim start="<%text[^>]*>" end="</%text>"

" Attribute Sublexing
syn match sqlMakoAttributeKey containedin=sqlMakoTag contained "[a-zA-Z_][a-zA-Z0-9_]*="
syn region sqlMakoAttributeValue containedin=sqlMakoTag contained start=/"/ skip=/\\"/ end=/"/
" syn region sqlMakoAttributeValue containedin=sqlMakoTag contained start=/'/ skip=/\\'/ end=/'/

" Tags
syn region sqlMakoTag matchgroup=sqlMakoDelim start="<%\(def\|call\|page\|include\|namespace\|inherit\|block\|[a-zA-Z_][a-zA-Z0-9_]*:[a-zA-Z_][a-zA-Z0-9_]*\)\>" end="/\?>"
syn match sqlMakoDelim "</%\(def\|call\|namespace\|block\|[a-zA-Z_][a-zA-Z0-9_]*:[a-zA-Z_][a-zA-Z0-9_]*\)>"

" Newline Escapes
syn match sqlMakoEscape /\\$/



syn include @sqlPhpTop syntax/php.vim

syn region sqlPhpRegion matchgroup=sqlPhpDelim start="<?php" end="?>" contains=@sqlPhpTop

syn match sqlTypeConversion "::[a-zA-Z0-9_]\+"
syn match sqlColonParam ":[a-zA-Z0-9_]\+"

" The default public schema
syn keyword sqlPublicSchema public
syn keyword sqlBoolean true True TRUE false False FALSE
syn keyword sqlUnreserved class content level locale locked path action comments comment global 
syn keyword sqlUnreserved superuser option options type types name value version edges data role
syn keyword sqlUnreserved rows

syn sync clear sqlFunction
syn keyword sqlFunction coalesce any now max sum count concat to_char extract replace

syn keyword sqlCustomFunction hashid slugify
syn keyword sqlJsonFunction jsonb_agg jsonb_build_object
syn keyword sqlJsonFunction json_agg json_build_object

syn keyword sqlPostgresFunction to_tsquery array_length in_array get_random_uuid currval
