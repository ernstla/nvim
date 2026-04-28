local nbsp = vim.fn.nr2char(160) -- U+00A0
local columns = require('canola.columns')

columns.register('space', {
    default_align = 'left',
    render = function()
        return { nbsp, nil } -- two spaces
    end,
})

local detail_columns = { "permissions", "space", "mtime", "size", "space", "icon" }
local default_columns = { "icon" }
local details = false
vim.g.canola = {
    columns = default_columns,
    keymaps = {
        ["-"] = { callback = "actions.parent", mode = "n" },
        ["_"] = { callback = "actions.open_cwd", mode = "n" },
        ["."] = { callback = "actions.toggle_hidden", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-i>"] = { callback = "actions.select", opts = { vertical = true } },
        ["<C-h>"] = {},
        ["<C-s>"] = { callback = "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { callback = "actions.select", opts = { tab = true } },
        ["<C-p>"] = { callback = "actions.preview", opts = {} },
        ["<F5>"] = { callback = "actions.refresh", opts = {} },
        ["R"] = { callback = "actions.refresh", opts = {} },
        ["?"] = { callback = "actions.show_help", opts = {} },
        ["gs"] = { callback = "actions.change_sort", mode = "n" },
        ["q"] = { callback = "actions.close", mode = "n" },
        ["`"] = { callback = "actions.cd", mode = "n" },
        ["g~"] = { callback = "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gx"] = "actions.open_external",
        ["D"] = {
            desc = "Toggle file detail view",
            callback = function()
                details = not details
                if details then
                    require("canola").set_columns(detail_columns)
                else
                    require("canola").set_columns(default_columns)
                end
            end,
        },
    },
}
vim.keymap.set('n', '-', "<CMD>Canola<CR>", { desc = "Open parent directory" })
