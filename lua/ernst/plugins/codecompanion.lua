if not pcall(require, "ernst/secrets") then
    return
end

local secrets = require("ernst/secrets")

return {
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        opts = {
            preview = {
                filetypes = { "markdown", "codecompanion" },
                ignore_buftypes = {},
            },
        },
    },
    {
        "HakonHarnes/img-clip.nvim",
        opts = {
            filetypes = {
                codecompanion = {
                    prompt_for_file_name = false,
                    template = "[Image]($FILE_PATH)",
                    use_absolute_path = true,
                },
            },
        },
    },
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "ravitemer/mcphub.nvim"
        },
        opts = {
            strategies = {
                chat = {
                    adapter = "anthropic",
                    keymaps = {
                        send = {
                            modes = {
                                n = { "<C-g><C-g>" },
                                i = { "<C-g><C-g>" },
                            },
                            index = 2,
                            callback = "keymaps.send",
                            description = "Send",
                        },
                    }
                },
                inline = {
                    adapter = "anthropic",
                },
            },
            adapters = {
                anthropic = function()
                    return require("codecompanion.adapters").extend("anthropic", {
                        env = {
                            api_key = secrets.anthropic_key,
                        },
                    })
                end,
            },
            extensions = {
                mcphub = {
                    callback = "mcphub.extensions.codecompanion",
                    opts = {
                        make_vars = true,
                        make_slash_commands = true,
                        show_result_in_chat = true
                    }
                }
            },
        },
        config = function(spec)
            require("codecompanion").setup(spec.opts)
            require("which-key").add(
                {
                    {
                        { "<leader>cc", "<cmd>CodeCompanionChat<cr>",        desc = "CodeCompanion: New Chat",    nowait = true, remap = false },
                        { "<leader>ct", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion: Toggle Chat", nowait = true, remap = false },
                        { "<leader>ca", "<cmd>CodeCompanionActions<cr>",     desc = "CodeCompanion: Actions",     nowait = true, remap = false },
                    },
                    {
                        mode = { "v" },
                        { "<leader>ci", "<cmd>CodeCompanion<cr>", desc = "CodeCompanion: Inline", nowait = true, remap = false },
                    }
                }
            )
        end
    },
}
