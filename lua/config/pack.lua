vim.api.nvim_create_user_command('Update', function()
    vim.pack.update()
end, { desc = 'Check for plugin updates' })

vim.api.nvim_create_user_command('Plugins', function()
    vim.pack.update(nil, { offline = true })
end, { desc = 'List all installed plugins' })

vim.api.nvim_create_user_command('Clean', function(opts)
    local plugins = vim.iter(vim.pack.get(nil, { info = false })):filter(
        function(pkg)
            return not pkg.active
        end):map(
        function(pkg)
            return pkg.spec.name
        end):totable()
    for _, name in ipairs(plugins) do
        vim.pack.del({ name }, { force = opts.bang })
    end
end, { desc = 'Clean unconfigured plugins' })
