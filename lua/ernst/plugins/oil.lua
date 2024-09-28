return { {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        keymaps = {
            ["-"] = "actions.parent",
            ["."] = "actions.toggle_hidden",
            ["<C-i>"] = "actions.select_vsplit",
            ["<C-p>"] = "actions.preview",
            ["<C-s>"] = "actions.select_split",
            ["<C-t>"] = "actions.select_tab",
            ["<CR>"] = "actions.select",
            ["<F5>"] = "actions.refresh",
            ["?"] = "actions.show_help",
            ["_"] = "actions.open_cwd",
            ["gs"] = "actions.change_sort",
            ["q"] = "actions.close",
        },
        use_default_keymaps = false,
        float = {
            -- Padding around the floating window
            padding = 2,
            max_width = 0,
            max_height = 0,
            border = "rounded",
            win_options = {
                winblend = 0,
            },
            -- This is the config that will be passed to nvim_open_win.
            -- Change values here to customize the layout
            override = function(conf)
                local winpos = vim.api.nvim_win_get_position(0)
                local winwidth = vim.api.nvim_win_get_width(0)
                local winheight = vim.api.nvim_win_get_height(0)

                local width = math.min(80, winwidth - 20)
                local height = winheight - 50
                local row = (winheight / 3) - (height / 3) - 1

                if winheight <= 50 then
                    height = winheight - 20
                    row = (winheight / 2) - (height / 2) - 1
                end
                local col = (winwidth / 2) - (width / 2)

                conf.width = width
                conf.height = height
                conf.row = row + winpos[1]
                conf.col = col + winpos[2]

                return conf
            end,
        },
    },
    config = function(spec)
        require('oil').setup(spec.opts)

        vim.keymap.set('n', '-', "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
} }
