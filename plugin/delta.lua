vim.pack.add({
    'https://github.com/kokusenz/delta.lua',
    'https://github.com/kokusenz/deltaview.nvim',
})

require('deltaview').setup({
    -- keyconfig = {
    --     dv_toggle_keybind = "<leader>dd"
    -- },
    -- use_nerdfonts = false
})
