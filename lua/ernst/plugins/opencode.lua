return { {
    "NickvanDyke/opencode.nvim",
    config = function()
        vim.g.opencode_opts = {
            -- provider = {
            --     enabled = "tmux",
            --     tmux = {
            --         options = "-h", -- Open in a horizontal split
            --     }
            -- }
            provider = {
                enabled = "snacks",
                snacks = {
                    win = {
                        width = 125
                    }
                }
            }
        }

        vim.keymap.set({ "n", "x" }, "<leader>ot", function() require("opencode").toggle() end,
            { desc = "Toggle opencode" })
        vim.keymap.set({ "n", "x" }, "<leader>oa", function() require("opencode").ask("", { submit = true }) end,
            { desc = "Ask opencode" })
        vim.keymap.set({ "n", "x" }, "<leader>oc", function() require("opencode").select() end,
            { desc = "Execute opencode action…" })
        vim.keymap.set({ "n", "x" }, "ga", function() require("opencode").prompt("@this") end,
            { desc = "Add @this to opencode" })
        vim.keymap.set({ "n", "x" }, "gf", function() require("opencode").prompt("@buffer") end,
            { desc = "Add @buffer to opencode" })
        vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end, { desc = "Toggle opencode" })
    end,
} }
