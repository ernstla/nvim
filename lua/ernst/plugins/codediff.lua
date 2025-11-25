return { {
    "esmuellert/vscode-diff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
        require("vscode-diff").setup({
            -- Highlight configuration
            highlights = {
                -- Line-level: accepts highlight group names or hex colors (e.g., "#2ea043")
                line_insert = "#283b19", -- Line-level insertions
                line_delete = "#511313", -- Line-level deletions

                -- Character-level: accepts highlight group names or hex colors
                -- If specified, these override char_brightness calculation
                char_insert = "#96c963", -- TODO: did not work, check later
                char_delete = "#f59281",
                -- char_insert = nil, -- Character-level insertions (nil = auto-derive)
                -- char_delete = nil, -- Character-level deletions (nil = auto-derive)

                -- Brightness multiplier (only used when char_insert/char_delete are nil)
                -- nil = auto-detect based on background (1.4 for dark, 0.92 for light)
                -- char_brightness = nil, -- Auto-adjust based on your colorscheme
            },

            -- Diff view behavior
            diff = {
                disable_inlay_hints = true,     -- Disable inlay hints in diff windows for cleaner view
                max_computation_time_ms = 5000, -- Maximum time for diff computation (VSCode default)
            },

            -- Keymaps in diff view
            keymaps = {
                view = {
                    next_hunk = "<leader>]", -- Jump to next change
                    prev_hunk = "<leader>[", -- Jump to previous change
                    next_file = "<c-j>",     -- Next file in explorer mode
                    prev_file = "<c-k>",     -- Previous file in explorer mode
                },
                explorer = {
                    select = "<cr>", -- Open diff for selected file
                    hover = "K",     -- Show file diff preview
                    refresh = "R",   -- Refresh git status
                },
            },
        })

        require("which-key").add(
            { {
                mode = { "n" },
                {
                    '<leader>di',
                    '<cmd>CodeDiff<cr>',
                    desc = "Git diff repo"
                },
            }, {
                mode = { "n" },
                {
                    '<leader>df',
                    '<cmd>CodeDiff file HEAD<cr>',
                    desc = "Git diff file"
                },
            }, {
                mode = { "n" },
                {
                    '<leader>dc',
                    '<cmd>tabclose<cr>',
                    desc = "Git diff close tab"
                },
            } }
        )
    end,
} }
