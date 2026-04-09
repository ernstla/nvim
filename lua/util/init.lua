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

M.project_files = function()
    local opts = {} -- define here if you want to define something

    vim.fn.system('git rev-parse --is-inside-work-tree')

    if vim.v.shell_error == 0 then
        require "telescope.builtin".git_files(opts)
    else
        require "telescope.builtin".find_files(opts)
    end
end

return M
