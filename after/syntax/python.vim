" Vim syntax file
" Language:	Python
" Maintainer:	Thomas Ernst <thomas.ernst@ebenefuenf.de>

"""""""""
" Better class name support

" Clear default
syn clear pythonStatement

" Set it to what's in the Python file, minus the class.
syn keyword pythonStatement    as assert break continue del exec global
syn keyword pythonStatement    lambda nonlocal pass print return with yield
syn keyword pythonStatement    def nextgroup=pythonFunction skipwhite

" Now make seperate syntax groups for the class.
syn keyword pythonClassStmt class nextgroup=pythonClass skipwhite
syn match   pythonClass "\h\w*" display contained

" Avoid highlighting attributes as builtins – just added "pythonClass" here.
syn clear pythonAttribute
syn match   pythonAttribute /\.\h\w*/hs=s+1
    \ contains=ALLBUT,pythonBuiltin,pythonFunction,pythonClass,pythonAsync
    \ transparent

" Highlight the class statement and the class name.
hi def link pythonClassStmt pythonStatement

"""""
" More highlightings
syn keyword pythonConst         True False None
syn keyword pythonSelf          self cls
syn keyword pythonUnderUnder	__debug__ __doc__ __file__ __name__ __import__
syn keyword pythonUnderUnder	__package__ __all__ __metaclass__

"   Greift nur wenn vom Beginn der Zeile bis zum Anfang des Strings keine
"   Zeichen oder ausschliesslich Whitespaces sind
syn region pythonDocString  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonSpaceError
syn region pythonDocString  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonSpaceError
