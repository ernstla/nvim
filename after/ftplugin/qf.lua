local map = vim.api.nvim_buf_set_keymap
map(0, 'n', 'q', '<C-w>q', { noremap = true })
-- CTRL-t opens selection in new tab
vim.api.nvim_buf_set_keymap(0, 'n', '<C-t>', '<C-W><CR><C-W>T', { noremap = true, silent = true })
-- CTRL-s opens selection in horizontal split
vim.api.nvim_buf_set_keymap(
    0,
    'n',
    '<C-s>',
    [[<cmd>lua require'qf_helper'.open_split('split')<CR>]],
    { noremap = true, silent = true }
)
-- CTRL-v opens selection in vertical split
vim.api.nvim_buf_set_keymap(
    0,
    'n',
    '<C-v>',
    [[<cmd>lua require'qf_helper'.open_split('vsplit')<CR>]],
    { noremap = true, silent = true }
)
map(0, 'n', 'o', '<CR><C-W>p', { noremap = true, silent = true })
-- <C-k> scrolls up and jumps without leaving quickfix
map(0, 'n', 'K', 'k<CR><C-W>p', { noremap = true, silent = true })
-- <C-j> scrolls down and jumps without leaving quickfix
map(0, 'n', 'J', 'j<CR><C-W>p', { noremap = true, silent = true })
