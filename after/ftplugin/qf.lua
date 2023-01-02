local map = vim.api.nvim_buf_set_keymap
map(0, 'n', 'q', '<c-w>q', { noremap = true })
-- CTRL-t opens selection in new tab
vim.api.nvim_buf_set_keymap(0, 'n', '<c-t>', '<c-w><cr><c-w>T', { noremap = true, silent = true })
-- CTRL-s opens selection in horizontal split
vim.api.nvim_buf_set_keymap(
    0,
    'n',
    '<c-s>',
    [[<cmd>lua require'qf_helper'.open_split('split')<cr>]],
    { noremap = true, silent = true }
)
-- CTRL-v opens selection in vertical split
vim.api.nvim_buf_set_keymap(
    0,
    'n',
    '<c-v>',
    [[<cmd>lua require'qf_helper'.open_split('vsplit')<cr>]],
    { noremap = true, silent = true }
)
map(0, 'n', 'o', '<cr><c-w>p', { noremap = true, silent = true })
-- <c-k> scrolls up and jumps without leaving quickfix
map(0, 'n', 'K', 'k<cr><c-w>p', { noremap = true, silent = true })
-- <c-j> scrolls down and jumps without leaving quickfix
map(0, 'n', 'J', 'j<cr><c-w>p', { noremap = true, silent = true })
