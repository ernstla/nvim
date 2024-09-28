return { {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        mode = "document_diagnostics"
    },
    config = function(spec)
        require('trouble').setup(spec.opts)
        vim.keymap.set("n", "<leader>f", "<cmd>TroubleToggle<cr>",
            { silent = true, noremap = true }
        )
    end
} }
