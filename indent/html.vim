" A well-behaved indent script has a check at the top of it to see whether
" the buffer already has some sort of script-based indenting enabled, and
" if so does nothing.  For example, indent/html.vim has this:
" 
"   " Only load this indent file when no other was loaded.
"   if exists("b:did_indent")
"       finish
"   endif
"   let b:did_indent = 1
" 
" So, to disable it, you can just make a ~/.vim/indent/html.vim (or
" ~/vimfiles/indent/html.vim on Windows) and put in it the single line 
" let b:did_indent = 1 
