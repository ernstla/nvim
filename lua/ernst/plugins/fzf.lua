require('fzf-lua').setup({
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

})
