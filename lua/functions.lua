local M = {}

M.telescope_project_files = function()
    local opts = {} -- define here if you want to define something
    local ok = pcall(require'telescope.builtin'.git_files, opts)
    if not ok then require'telescope.builtin'.find_files(opts) end
end

M.telescope_all_files = function()
    local opts = {
        hidden = true,
        no_ignore = true,
        file_ignore_patterns = {'^.git/', 'vendor', 'node_modules', 'data'}
    }
    require'telescope.builtin'.find_files(opts)
end

return M
