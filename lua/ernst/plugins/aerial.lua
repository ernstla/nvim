return { {
    'stevearc/aerial.nvim',
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        layout = {
            max_width = 30,
            width = 30,
            min_width = 30,
            default_direction = "prefer_left",
            resize_to_content = false,
        },
        nav = {
            border = "rounded",
            max_height = 0.9,
            min_height = { 41, 0.1 },
            keymaps = {
                ["<CR>"] = "actions.jump",
                ["<2-LeftMouse>"] = "actions.jump",
                ["<C-v>"] = "actions.jump_vsplit",
                ["<C-s>"] = "actions.jump_split",
                ["h"] = "actions.left",
                ["l"] = "actions.right",
                ["<esc>"] = "actions.close",
                ["q"] = "actions.close",
            },
        }
    },
    config = function(spec)
        require('aerial').setup(spec.opts)

        require("which-key").add({ {
            mode = { "n" },
            {
                '<leader>ss',
                '<cmd>AerialNavOpen<cr>',
                desc = "aerial: open "
            },
            {
                '<leader>st',
                '<cmd>Telescope aerial<cr>',
                desc = "aerial: telescope"
            },
            {
                '<leader>sf',
                '<cmd>AerialToggle float<cr>',
                desc = "aerial: float"
            },
            {
                '<leader>sa',
                '<cmd>AerialToggle<cr>',
                desc = "aerial: toggle"
            },
        } })
    end
} }
