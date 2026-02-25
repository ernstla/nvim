return { {
    'uga-rosa/ccc.nvim',
    opts = {},
    config = function(_, opts)
        require('ccc').setup(opts)

        vim.keymap.set('n', '<f7>', '<cmd>CccConvert<cr>', { noremap = true, silent = true, nowait = true })

        local command = vim.api.nvim_create_user_command
        command('Colors', 'CccHighlighterToggle', {})
        command('Colorpicker', 'CccPick', {})
        command('ColorConvert', 'CccConvert', {})
    end
} }
