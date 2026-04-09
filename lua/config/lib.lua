M = {}

function M.reload_colorscheme()
    package.loaded["serious/colors"] = nil
    package.loaded['serious/base'] = nil
    package.loaded['serious/languages'] = nil
    package.loaded['serious/plugins'] = nil
    package.loaded['serious/treesitter'] = nil
    package.loaded["serious"] = nil
    require("serious")
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
