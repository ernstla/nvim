M = {}

function M.reload_colorscheme()
    package.loaded["theme/colors"] = nil
    package.loaded['theme/base'] = nil
    package.loaded['theme/languages'] = nil
    package.loaded['theme/plugins'] = nil
    package.loaded['theme/treesitter'] = nil
    package.loaded["theme"] = nil
    require("theme")
    vim.cmd.colorscheme('serious')
end

return M
