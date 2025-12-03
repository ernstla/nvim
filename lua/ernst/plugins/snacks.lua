local color = require('serious/colors')
local function session()
    require('mini.sessions').select()
end

return { {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
        {
            "<leader>n",
            function() require("snacks").picker.notifications() end,
            desc = "Notification History",
        },
    },
    opts = {
        bigfile = {},
        input = {},
        quickfile = {},
        scope = {},
        scroll = {},
        statuscolumn = {},
        terminal = {},

        notifier = {
            timeout = 5000,
            top_down = false,
            margin = { top = 1, right = 1, bottom = 2 },
        },
        dashboard = {
            preset = {
                keys = {
                    --{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
                    { icon = " ", key = "i", desc = "New File", action = ":enew | startinsert" },
                    { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = " ", key = "s", desc = "Restore Session", action = session },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    { icon = " ", key = "n", desc = "Close Dashboard", action = ":enew" },
                },
            },
            sections = {
                { section = "header" },
                { section = "keys",   gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
        picker = {
            actions = {
                yank_notification_and_close = function(picker)
                    local items = picker:selected({ fallback = true })
                    if not items or #items == 0 then
                        return
                    end

                    local item = items[1]
                    local notif = item.notif or item.value or item
                    local msg = notif.message
                        or notif.text
                        or notif.title
                        or vim.inspect(notif)

                    vim.fn.setreg('"', msg)
                    vim.fn.setreg('+', msg)

                    picker:close()
                end,
            },
            sources = {
                notifications = {
                    win = {
                        input = {
                            keys = {
                                ["<CR>"] = { "yank_notification_and_close", mode = { "n", "i" } },
                            },
                        },
                    },
                },
            },
        },
    },
} }
