vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/folke/which-key.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
})

require('which-key').setup({
    icons = { mappings = false },
    delay = 500,
    keys = {
        scroll_down = "<c-f>",
        scroll_up = "<c-b>",
    },
})

vim.cmd.colorscheme('serious')
require('ernst/settings')
require("ernst")
