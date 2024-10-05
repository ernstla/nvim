if not pcall(require, 'ernst/secrets') then
    return {}
end

local secrets = require('ernst/secrets')

return { {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "hrsh7th/nvim-cmp",                      -- Optional: For using slash commands and variables in the chat buffer
        "nvim-telescope/telescope.nvim",         -- Optional: For using slash commands
        { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
    },
    opts = function()
        return {
            strategies = {
                chat = { adapter = "anthropic" },
                inline = { adapter = "anthropic" },
                agent = { adapter = "anthropic" },
            },
            adapters = {
                anthropic = require("codecompanion.adapters").extend("anthropic", {
                    model = {
                        default = "claude-3-5-sonnet-20240620",
                    },
                    env = {
                        api_key = secrets.anthropic_key
                    },
                }),
                openai = require("codecompanion.adapters").extend("openai", {
                    env = {
                        api_key = secrets.openai_api_key
                    },
                })
            },
            display = {
                diff = {
                    provider = "mini_diff",
                },
            },
            opts = {
                log_level = "DEBUG",
            },
        }
    end,
    config = function(spec)
        require('codecompanion').setup(spec.opts())

        vim.cmd([[cab cc CodeCompanion]])
        vim.cmd([[cab ca CodeCompanionActions]])

        vim.api.nvim_set_keymap("n", "<LocalLeader>gg", "<cmd>CodeCompanionChat Toggle<cr>",
            { noremap = true, silent = true })
        vim.api.nvim_set_keymap("v", "<LocalLeader>gg", "<cmd>CodeCompanionChat Toggle<cr>",
            { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<LocalLeader>gi", "<cmd>CodeCompanion<cr>",
            { noremap = true, silent = true })
        vim.api.nvim_set_keymap("v", "<LocalLeader>gi", "<cmd>CodeCompanion<cr>",
            { noremap = true, silent = true })
        vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
    end
} }
