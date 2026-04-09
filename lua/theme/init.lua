local base = require('theme/base')
local languages = require('theme/languages')
local plugins = require('theme/plugins')
local treesitter = require('theme/treesitter')
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
