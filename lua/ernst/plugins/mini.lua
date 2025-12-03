local sessions_dir = vim.fn.expand(vim.fn.stdpath("config") .. "/sessions")
if vim.fn.isdirectory(sessions_dir) == 0 then
    vim.fn.mkdir(sessions_dir, "p")
end

local function session_name_complete(miniSessions)
    -- make sure setup ran and detection exists
    if not miniSessions or not miniSessions.detected then
        return {}
    end

    local names = {}
    for name, _ in pairs(miniSessions.detected) do
        table.insert(names, name)
    end
    table.sort(names)
    return names
end

return {
    {
        'nvim-mini/mini.surround',
        version = false,
        opts = {
            mappings = {
                add = 'sa',        -- Add surrounding in Normal and Visual modes
                delete = 'sd',     -- Delete surrounding
                find = 'sf',       -- Find surrounding (to the right)
                find_left = 'sF',  -- Find surrounding (to the left)
                highlight = 'sh',  -- Highlight surrounding
                replace = 'sr',    -- Replace surrounding

                suffix_last = 'l', -- Suffix to search with "prev" method
                suffix_next = 'n', -- Suffix to search with "next" method
            },
            n_lines = 20,          -- Number of lines within which surrounding is searched
        }
    },
    {
        'nvim-mini/mini.splitjoin',
        opts = {
            mappings = {
                toggle = 'gp',
                split = '',
                join = '',
            },
        },
    },
    {
        'nvim-mini/mini.sessions',
        opts = {
            -- Whether to read default session if Neovim opened without file arguments
            autoread = false,
            -- Whether to write currently read session before leaving it
            autowrite = true,
            -- Directory where global sessions are stored (use `''` to disable)
            directory = sessions_dir,
            -- File for local session (use `''` to disable)
            file = '',
            -- Whether to force possibly harmful actions (meaning depends on function)
            force = { read = false, write = true, delete = false },
            -- Hook functions for actions. Default `nil` means 'do nothing'.
            hooks = {
                -- Before successful action
                pre = { read = nil, write = nil, delete = nil },
                -- After successful action
                post = { read = nil, write = nil, delete = nil },
            },
            -- Whether to print session path after action
            verbose = { read = false, write = true, delete = true },
        },
        config = function(spec)
            local miniSessions = require("mini.sessions")
            miniSessions.setup(spec.opts)

            vim.api.nvim_create_user_command("Session", function(opts)
                if opts.args == "" then
                    vim.notify("Please provide a session name", vim.log.levels.WARN)
                    return
                end
                miniSessions.write(opts.args)
            end, {
                nargs = "?",
                complete = function() return session_name_complete(miniSessions) end,
            })

            vim.api.nvim_create_user_command("Load", function(opts)
                local name = opts.args
                if name == "" then
                    miniSessions.select()
                else
                    miniSessions.read(name)
                end
            end, {
                nargs = "?",
                complete = function() return session_name_complete(miniSessions) end,
            })
        end
    },
    {
        'nvim-mini/mini.ai',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        version = '*',
        config = function()
            local miniAi = require("mini.ai")
            miniAi.setup({
                n_lines = 100,
                custom_textobjects = {
                    f = miniAi.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
                },
            })
        end,
    },
    {
        "nvim-mini/mini.diff",
        config = function()
            local diff = require("mini.diff")
            diff.setup({
                -- Disabled by default
                source = diff.gen_source.none(),
            })
        end,
    }
}
