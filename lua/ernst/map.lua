local function map(mode, lhs, rhs, newopts)
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


-- Terminal mode mappings incl. tmux.nvim navigation
vim.keymap.set('t', '<c-h>', '<Cmd>lua require("tmux").move_left()<CR>')
vim.keymap.set('n', '<c-j>', function()
    if vim.bo.filetype == 'fzf' then
        return '<c-j>'
    else
        return '<Cmd>lua require("tmux").move_bottom()<CR>'
    end
end, { expr = true, noremap = true })
vim.keymap.set('n', '<c-k>', function()
    if vim.bo.filetype == 'fzf' then
        return '<c-k>'
    else
        return '<Cmd>lua require("tmux").move_top()<CR>'
    end
end, { expr = true, noremap = true })
vim.keymap.set('t', '<c-l>', '<Cmd>lua require("tmux").move_right()<CR>')
map('t', '<leader><esc>', '<c-\\><c-n>')
map('t', '<c-q>', '<c-\\><c-n>')

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

map('n', '<F12>', require('ernst/lib').reload_colorscheme, { desc = 'Reload colorscheme' })

map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)

map('i', '<C-s>', vim.lsp.buf.signature_help, { desc = 'Show signature help' })

require("which-key").add(
    { {
        mode = { "n" },
        --
        -- Resize window
        { '<leader>>',  '20<c-w>>',                               desc = 'make window wider',           nowait = true,  remap = false },
        { '<leader><',  '20<c-w><',                               desc = 'make window narrower',        nowait = true,  remap = false },
        { '<leader>=',  '10<c-w>+',                               desc = 'make window taller',          nowait = true,  remap = false },
        { '<leader>-',  '10<c-w>-',                               desc = 'make window lower',           nowait = true,  remap = false },

        -- Toggle invisibles
        { '<leader>i',  ':set list!<cr>',                         desc = 'toggle invisibles',           nowait = true,  remap = false },
        { '<leader>e',  vim.diagnostic.open_float,                desc = 'show line diagnostics',       nowait = true,  remap = false },
        { '<leader>q',  vim.diagnostic.setloclist,                desc = 'show diagnostic in loc list', nowait = true,  remap = false },

        { '<leader>gs', '<cmd>Git<cr>',                           desc = 'git status',                  nowait = true,  remap = false },
        { '<leader>gw', '<cmd>Gitsigns blame (who)<cr>',          desc = 'git blame (who)',             nowait = true,  remap = false },
        { '<leader>gb', '<cmd>Git blame<cr>',                     desc = 'git blame',                   nowait = true,  remap = false },
        { '<leader>gl', '<cmd>Gitsigns blame_line<cr>',           desc = 'git blame (line)',            nowait = true,  remap = false },

        -- Tailwind Tools
        { '<leader>tw', '<cmd>TailwindConcealToggle<cr>',         desc = 'tailwind coceal',             nowait = true,  remap = false },
        { '<leader>tc', '<cmd>TailwindColorToggle<cr>',           desc = 'tailwind show/hide colors',   nowait = true,  remap = false },

        -- Tabs
        { '<leader>tt', ':tabnew<cr>',                            desc = 'tab new',                     nowait = true,  remap = false },
        { '<leader>tr', ':tabclose<cr>',                          desc = 'tab close',                   nowait = true,  remap = false },

        -- Toggle hlsearch
        { '<leader>h',  ':set hlsearch!<cr>',                     desc = 'toggle search highlighting',  nowait = true,  remap = false },

        -- Toggle relativenumber
        -- { '<leader>tr', ':set relativenumber!<cr>',               desc = 'toggle relative number',      nowait = true,  remap = false },

        -- Toggle wrapping
        { '<leader>w',  ':set wrap! wrap?<cr>',                   desc = 'toggle line wrapping',        nowait = true,  remap = false },

        -- Reformat paragraph
        { '<leader>f',  'vipgq',                                  desc = 'reformat paragraph',          nowait = true,  remap = false },

        -- Inspect treesitter and highlighter groups
        { '<leader>p',  ':Inspect<cr>',                           desc = 'show highlighting info',      nowait = true,  remap = true },

        { 'gD',         "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = 'Goto global declaration',     noremap = true, silent = true },
        { 'gd',         "<cmd>lua vim.lsp.buf.definition()<CR>",  desc = 'Goto local definition',       noremap = true, silent = true },
    } }
)
