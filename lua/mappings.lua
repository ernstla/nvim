--Remap space as leader key
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map('n', 'k', 'gk', opts)
map('n', '<up>', 'gk', opts)
map('n', 'j', 'gj', opts)
map('n', '<down>', 'gj', opts)
map('v', 'k', 'gk', opts)
map('v', '<up>', 'gk', opts)
map('v', 'j', 'gj', opts)
map('v', '<down>', 'gj', opts)

map('n', 'Y', 'y$', opts)

-- Visually select current line without line ending
map('n', '_', '^vg_', opts)
-- Easier quotes
map('n', 'ci2', 'ci"', opts)
map('n', 'ca2', 'ca"', opts)
map('n', 'di2', 'di"', opts)
map('n', 'da2', 'da"', opts)
map('n', 'yi2', 'yi"', opts)
map('n', 'ya2', 'ya"', opts)
-- Double the number of leading spaces
map('n', '<leader>ds', ':%s/^\\s*/&&<cr>', opts)
map('v', '<leader>ds', ':s/^\\s*/&&<cr>', opts)

map('n', '<leader>tt', ':tabnew<cr>', opts)
map('i', '<c-space>', '<c-x><c-o>', opts)
-- Toggle hlsearch
map('n', '<leader>h', ':set hlsearch!<cr>', opts)
-- Toggle relativenumber
map('n', '<leader>r', ':set relativenumber!<cr>', opts)
-- Toggle wrapping
map('n', '<leader>w', ':set wrap! wrap?<cr>', opts)
-- Toggle invisibles
map('n', '<leader>i', ':set list!<cr>', opts)
-- Resize window
map('', '<leader>>', '20<C-w>>', opts)
map('', '<leader><', '20<C-w><', opts)
-- Center search matches
map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)
map('n', '*', '*zz', opts)
map('n', '#', '#zz', opts)
map('', '<c-o>', '<C-O>zz', opts)
map('', '<c-i>', '<C-I>zz', opts)
-- Run last macro
map('n', 'Q', '@@', opts)
-- Side panes
map('n', '<c-p>', [[<cmd>lua require('functions').telescope_project_files()<CR>]], opts)
map('n', '<m-p>', [[<cmd>lua require('functions').telescope_all_files()<CR>]], opts)
map('n', '<c-f3>', ':Telescope quickfix<cr>', opts)
map('n', '<f5>', ':UndotreeToggle<cr>', opts)
map('n', '<f8>', ':NERDTreeToggle<cr>', opts)
map('n', '<f9>', ':Telescope buffers<cr>', opts)
map('n', '<c-f9>', ':BufExplorer<cr>', opts)
map('n', '<f10>', ':TagbarToggle<cr>', opts)
-- Git
map('', '<leader>gs', '<esc>:Git<cr>', opts)
map('', '<leader>gb', '<esc>:Git blame<cr>', opts)
-- Telescope

vim.cmd [[
    " Easy navigation in Quickfix window
    function! ToggleQuickFix()
        if empty(filter(getwininfo(), 'v:val.quickfix'))
            botright copen 15
        else
            cclose
        endif
    endfunction
    nnoremap <silent> <F2> :call ToggleQuickFix()<cr>
    nnoremap <silent> <C-F3> :call ToggleQuickFix()<cr>
    nnoremap <F3> :cnext<cr>zz
    nnoremap <S-F3> :cprevious<cr>

    " Easy navigation in Location List
    nnoremap <F4> :lnext<cr>zz
    nnoremap <C-F4> :botright lopen 15<cr>
    nnoremap <S-F4> :lprevious<cr>zz


    " ripgrep and silver searcher
    function! Grp(args)
        execute "silent! :botright :grep " . a:args
    endfunction
    command! -nargs=* -complete=file Grep call Grp(<q-args>)
    command! -nargs=* -complete=file Ag call Grp(<q-args>)
    command! -nargs=* -complete=file AG call Grp(<q-args>)
    command! -nargs=* -complete=file Rg call Grp(<q-args>)

    " Save root files
    command W w !sudo tee % > /dev/null

    " Format json and HTML tidy
    command Jsonify   %!python3 -m json.tool
    command Tidy      !tidy -mi -html -wrap 0 %

    " Identify the syntax highlighting group used at the cursor
    nnoremap <Leader>p :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

    " Navigate with +/= and - between changes and center change on screen
    " Catch the transition to diff mode
    au FilterWritePre * if &diff | exe 'noremap = ]cz.' | exe 'noremap + ]cz.' | exe 'noremap - [cz.' | exe 'noremap U :diffupdate<cr>' | endif
    au FilterWritePre * if &diff |  exe 'execute "normal zR"' | endif
    " au FilterWritePre * if &diff | exe 'set diffopt=filler,context:1000' | exe 'execute "normal \<c-w>\<c-w>"' | endif
]]

if vim.fn.has('wsl') == 1 then
    vim.api.nvim_exec(
    [[
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * :call system('clip.exe ',@")
        augroup end
    ]],
        false
    )
end
