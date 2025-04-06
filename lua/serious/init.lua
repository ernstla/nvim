local base = require('serious/base')
local languages = require('serious/languages')
local plugins = require('serious/plugins')
local treesitter = require('serious/treesitter')
local M = {}

function M.colorscheme()
    local categories = {
        base.gui,
        base.syntax,
        languages,
        plugins,
        treesitter,
    }

    for _, category in pairs(categories) do
        for group, highlight in pairs(category) do
            vim.api.nvim_set_hl(0, group, highlight)
        end
    end
end

return M
