return { {
    "mistweaverco/kulala.nvim",
    keys = {
        { "<leader>ks", desc = "Kulala: Send request" },
        { "<leader>ka", desc = "Kulala: Send all requests" },
        { "<leader>kb", desc = "Kulala: Open scratchpad" },
    },
    ft = { "http", "rest" },
    opts = {
        -- your configuration comes here
        global_keymaps = false,
    },
} }
