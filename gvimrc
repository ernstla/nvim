" Cursor is a thin line if in insert mode otherwsie a block
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver1-iCursor
set guicursor+=n-v-c:blinkon0-Cursor
colorscheme newernst

if has('win32')
    set guifont=Consolas:h10:cANSI
	set linespace=-1

else
    set guifont=Roboto\ Mono\ for\ Powerline\ 11
    set linespace=0
endif

" Don't show toolbar and scrollbars
set guioptions-=T to
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=e
set tabline=%!MyTabLine()

" Highlight wrong spelling
highlight SpellBad term=underline gui=undercurl guisp=Red

" Set size and position
set lines=50
set columns=126 
winpos 250 40
