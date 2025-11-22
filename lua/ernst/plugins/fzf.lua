return { {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    opts = {
        winopts = {
            border = 'single'
        },
        keymap = {
            builtin = {
                -- These apply to the builtin fzf-lua picker
                ["<C-j>"] = "down",
                ["<C-k>"] = "up",
                ["<C-f>"] = "preview-page-down",
                ["<C-b>"] = "preview-page-up",
            }
        }
    }
} }
