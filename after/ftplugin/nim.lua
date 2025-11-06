vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true

vim.bo.autoindent = true
vim.bo.smartindent = false
vim.bo.cindent = false
vim.bo.indentkeys = "o,O,*<Return>,},],)"

vim.cmd([[
  function! NimIndent()
	let lnum = v:lnum
	let prev_lnum = prevnonblank(lnum - 1)

	if prev_lnum == 0
		return 0
	endif

	let prev_line = getline(prev_lnum)
	let prev_indent = indent(prev_lnum)
	let curr_line = getline(lnum)

	" If current line starts with proc/method/type/etc at the beginning,
	" it should have 0 indent (preserve top-level declarations)
	if curr_line =~# '^\(proc\|method\|template\|macro\|iterator\|converter\|type\|enum\|const\|var\|let\)\>'
		return 0
	endif

	" Decrease indent for closing brackets
	if curr_line =~# '^\s*[}\])]'
		return prev_indent - shiftwidth()
	endif

	" Check for proc/method/template/macro/iterator/converter definitions ending with =
	if prev_line =~# '^\s*\(proc\|method\|template\|macro\|iterator\|converter\)\s\+.*=\s*$'
		return prev_indent + shiftwidth()
	endif

	" Check for type/enum/object definitions
	if prev_line =~# '^\s*\(type\|enum\|object\|tuple\|concept\)\s*=\?\s*$'
		return prev_indent + shiftwidth()
	endif

	" Check for type definitions with = object/enum/etc
	if prev_line =~# '^\s*\w\+\*\?\s*=\s*\(object\|enum\|tuple\|ref object\|ref tuple\)'
		return prev_indent + shiftwidth()
	endif

	" Check for block starters ending with colon
	if prev_line =~# ':\s*$'
		return prev_indent + shiftwidth()
	endif

	" Check for opening brackets {[(
	if prev_line =~# '[{[(]\s*$'
		return prev_indent + shiftwidth()
	endif

	" Keep current indentation
	return prev_indent
  endfunction

  setlocal indentexpr=NimIndent()
  setlocal indentkeys=o,O,*<Return>,},],)
]])
