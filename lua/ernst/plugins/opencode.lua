return { {
    "NickvanDyke/opencode.nvim",
    config = function()
        vim.g.opencode_opts = {
            provider = {
                enabled = "terminal",
                terminal = {
                    vertical = true,
                    split = 'right',
                    win = 0,
                    width = 131
                }
            },
            events = {
                enabled = true,
                reload = true,
                permissions = {
                    enabled = false,
                },
            },
        }

        vim.keymap.set({ "n", "x" }, "<leader>ot", function() require("opencode").toggle() end,
            { desc = "Toggle opencode" })
        vim.keymap.set({ "n", "x" }, "<leader>oa", function() require("opencode").ask("", { submit = true }) end,
            { desc = "Ask opencode" })
        vim.keymap.set({ "n", "x" }, "<leader>oc", function() require("opencode").select() end,
            { desc = "Execute opencode action…" })
        vim.keymap.set({ "n", "x" }, "ga", function() require("opencode").prompt("@this") end,
            { desc = "Add @this to opencode" })
        vim.keymap.set({ "n", "x" }, "gb", function() require("opencode").prompt("@buffer") end,
            { desc = "Add @buffer to opencode" })
        vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end, { desc = "Toggle opencode" })
    end,
} }
