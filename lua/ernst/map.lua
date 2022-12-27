--Remap space as leader key
local map = vim.keymap.set
local opts = { noremap = true, silent = true, nowait = true }

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

-- Tabs
map('n', '<leader>tt', ':tabnew<cr>', opts)

-- Autocompletion
--map('i', '<c-space>', '<c-x><c-o>', opts)

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
