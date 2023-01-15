local actions = require 'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require 'lir.clipboard.actions'
local float = require 'lir.float'


-- Construct the Lir floating window options according to the window we are
-- currently in. The position of the window will be centered in the current
-- window, thus not blocking other windows if opened.
---@return table<string, any>
local function construct_win_opts()
    local winpos = vim.api.nvim_win_get_position(0)
    local winwidth = vim.api.nvim_win_get_width(0)
    local winheight = vim.api.nvim_win_get_height(0)

    local width = math.min(80, winwidth - 20)
    local height = winheight - 50
    local row = (winheight / 3) - (height / 3) - 1

    if winheight <= 50 then
        height = winheight - 20
        row = (winheight / 2) - (height / 2) - 1
    end
    local col = (winwidth / 2) - (width / 2)

    return {
        width = width,
        height = height,
        row = row + winpos[1],
        col = col + winpos[2],
    }
end

require 'lir'.setup {
    show_hidden_files = false,
    ignore = { ".DS_Store" },
    devicons = { enable = true },
    mappings = {
        ['<cr>']  = actions.edit,
        ['<c-s>'] = actions.split,
        ['<c-v>'] = actions.vsplit,
        ['<c-t>'] = actions.tabedit,

        ['-'] = actions.up,
        ['q'] = actions.quit,
        ['<esc>'] = actions.quit,
        ['<c-c>'] = actions.quit,

        ['K'] = actions.mkdir,
        ['+'] = actions.newfile,
        ['R'] = actions.rename,
        ['@'] = actions.cd,
        ['Y'] = actions.yank_path,
        ['.'] = actions.toggle_show_hidden,
        ['H'] = actions.toggle_show_hidden,
        ['D'] = actions.delete,

        ['J'] = function()
            mark_actions.toggle_mark()
            vim.cmd('normal! j')
        end,
        ['C'] = clipboard_actions.copy,
        ['X'] = clipboard_actions.cut,
        ['P'] = clipboard_actions.paste,
    },
    float = {
        winblend = 0,
        win_opts = construct_win_opts,
        curdir_window = {
            enable = true,
            highlight_dirname = true
        },

        -- -- You can define a function that returns a table to be passed as the third
        -- -- argument of nvim_open_win().
        -- win_opts = function()
        --   local width = math.floor(vim.o.columns * 0.8)
        --   local height = math.floor(vim.o.lines * 0.8)
        --   return {
        --     border = {
        --       "+", "─", "+", "│", "+", "─", "+", "│",
        --     },
        --     width = width,
        --     height = height,
        --     row = 1,
        --     col = math.floor((vim.o.columns - width) / 2),
        --   }
        -- end,
    },
    hide_cursor = true,
    on_init = function()
        -- use visual mode
        vim.api.nvim_buf_set_keymap(
            0,
            "x",
            "J",
            ':<c-u>lua require"lir.mark.actions".toggle_mark("v")<cr>',
            { noremap = true, silent = true }
        )

        -- echo cwd
        vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
    end,
}

-- vim.api.nvim_set_keymap('n', '-', [[<cmd> execute 'silent! edit ' .. expand('%:p:h')<cr>]], { noremap = true })
vim.keymap.set('n', '-', function() float.toggle() end, { noremap = true })
