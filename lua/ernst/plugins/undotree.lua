return {
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<f5>', vim.cmd.UndotreeToggle)
        end
    }
}
