local synIDattr = vim.fn.synIDattr
local synID = vim.fn.synID
local synIDtrans = vim.fn.synIDtrans
local line = vim.fn.line
local col = vim.fn.col

M = {}


local get_highlight_group = function()
    local hi = synIDattr(synID(line('.'), col('.'), 1), 'name')
    local trans = synIDattr(synID(line('.'), col('.'), 0), 'name')
    local lo = synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')

    return 'group:<' .. hi .. '>  transparent:<' .. trans .. '>  inherited:<' .. lo .. '>'
end


M.print_highlight_group = function()
    local buf = vim.api.nvim_get_current_buf()
    local highlighter = require "vim.treesitter.highlighter"

    if highlighter.active[buf] then
        vim.cmd('TSNodeUnderCursor')
        --vim.cmd('TSHighlightCapturesUnderCursor')
    else
        print(get_highlight_group())
    end
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
