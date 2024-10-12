--Remap space as leader key
local map = vim.keymap.set

function map(mode, lhs, rhs, newopts)
    local opts = { noremap = true, silent = true, nowait = true }
    newopts = newopts or {}
    for k, v in pairs(newopts) do opts[k] = v end
    vim.keymap.set(mode, lhs, rhs, opts)
end

map('', '<space>', '<nop>')

map('n', 'k', 'gk')
map('n', '<up>', 'gk')
map('n', 'j', 'gj')
map('n', '<down>', 'gj')
map('v', 'k', 'gk')
map('v', '<up>', 'gk')
map('v', 'j', 'gj')
map('v', '<down>', 'gj')

map('n', 'Y', 'y$')
map("x", "p", [["_dP`[v`]=]], { desc = "Paste, but don't override the yank register" })
map("x", "P", "p", { desc = "P with the default p behaviour" })

-- Visually select current line without line ending
map('n', '_', '^vg_')

-- Easier quotes
map('n', 'ci2', 'ci"')
map('n', 'ca2', 'ca"')
map('n', 'di2', 'di"')
map('n', 'da2', 'da"')
map('n', 'yi2', 'yi"')
map('n', 'ya2', 'ya"')

-- Double the number of leading spaces
map('n', '<leader>ds', ':%s/^\\s*/&&<cr>')
map('v', '<leader>ds', ':s/^\\s*/&&<cr>')

-- Tabs
map('n', '<leader>tt', ':tabnew<cr>')

-- Autocompletion
map('i', '<c-n>', '<c-x><c-o>')

-- Toggle hlsearch
map('n', '<leader>h', ':set hlsearch!<cr>')

-- Toggle relativenumber
map('n', '<leader>tr', ':set relativenumber!<cr>')

-- Toggle wrapping
map('n', '<leader>w', ':set wrap! wrap?<cr>')

-- Reformat paragraph
map('n', '<leader>f', 'vipgq')

-- Toggle invisibles
map('n', '<leader>i', ':set list!<cr>')

-- Resize window
map('', '<leader>>', '20<c-w>>')
map('', '<leader><', '20<c-w><')
map('', '<leader>=', '10<c-w>+')
map('', '<leader>-', '10<c-w>-')

map('t', '<ESC><ESC>', '<C-\\><C-n>')

-- Center search matches
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
map('n', '*', '*zz')
map('n', '#', '#zz')
map('', '<c-o>', '<c-o>zz')
map('', '<c-i>', '<c-i>zz')


-- Run last macro
map('n', 'Q', '@@')
map('n', '<F6>', '@@')

-- Get TreeSitter or Neovim highlight group under cursor
map('n', '<leader>p', require('ernst/lib').print_highlight_group)

map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<leader>e', vim.diagnostic.open_float)
map('n', '<leader>q', vim.diagnostic.setloclist)

map('n', '<leader>gs', '<cmd>Git<cr>')
map('n', '<leader>gb', '<cmd>Git blame<cr>')

-- Tailwind Tools
map('n', '<leader>tw', '<cmd>TailwindConcealToggle<cr>')
map('n', '<leader>tc', '<cmd>TailwindColorToggle<cr>')
