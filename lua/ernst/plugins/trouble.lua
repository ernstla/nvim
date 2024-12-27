return { {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        mode = "workspace_diagnostics",
        focus = true, -- Focus the window when opened
        win = { size = 20 },
        modes = {
            symbols = {
                mode = "lsp_document_symbols",
                focus = true,
                win = { position = "right", size = 50 },
            },
        },
    },
    config = function(spec)
        require('trouble').setup(spec.opts)

        require("which-key").add(
            {
                {
                    { "<leader>te", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Trouble: toogle errors",  nowait = true, remap = false },
                    { "<leader>tE", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble: toogle errors",  nowait = true, remap = false },
                    { "<leader>ts", "<cmd>Trouble symbols toggle<cr>",                  desc = "Trouble: toogle symbols", nowait = true, remap = false },
                }
            }
        )
    end
} }
