return { {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio',
        'mfussenegger/nvim-dap-python',
    },
    opts = {
        layouts = { {
            elements = { {
                id = "scopes",
                size = 0.25
            }, {
                id = "breakpoints",
                size = 0.25
            }, {
                id = "stacks",
                size = 0.25
            }, {
                id = "watches",
                size = 0.25
            } },
            position = "left",
            size = 131
        }, {
            elements = { {
                id = "repl",
                size = 0.5
            }, {
                id = "console",
                size = 0.5
            } },
            position = "bottom",
            size = 17
        } },
    },
    config = function(spec)
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup(spec.opts)

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        -- PHP
        dap.adapters.php = {
            type = 'executable',
            command = vim.fn.getenv('HOME') .. '/.local/share/nvim/mason/bin/php-debug-adapter',
        }
        dap.configurations.php = {
            {
                type = 'php',
                request = 'launch',
                name = 'Listen for xdebug',
                port = 9003
            }
        }
        -- Python
        require("dap-python").setup("uv")
        table.insert(require('dap').configurations.python, {
            type = 'python',
            request = 'attach',
            name = 'Listen for debugpy',
            host = '127.0.0.1',
            port = 5678,
        })


        vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = 'DapLineNr' })
        vim.fn.sign_define('DapStopped',
            { text = '', texthl = 'DapStopped', linehl = '', numhl = 'DapLineNr' })

        require("which-key").add(
            {
                {
                    { '<F49>',      function() require('dap').terminate() end,         desc = 'DAP: terminate',         nowait = true, remap = false },
                    { '<leader>dt', function() require('dap').terminate() end,         desc = 'DAP: terminate',         nowait = true, remap = false },
                    { '<F50>',      function() require('dapui').open() end,            desc = 'DAP UI: open',           nowait = true, remap = false },
                    { '<leader>do', function() require('dapui').open() end,            desc = 'DAP UI: open',           nowait = true, remap = false },
                    { '<F51>',      function() require('dapui').close() end,           desc = 'DAP UI: close',          nowait = true, remap = false },
                    { '<leader>dc', function() require('dapui').close() end,           desc = 'DAP UI: close',          nowait = true, remap = false },
                    { '<F52>',      function() require('dap').toggle_breakpoint() end, desc = 'DAP: toggle breakpoint', nowait = true, remap = false },
                    { '<leader>dd', function() require('dap').toggle_breakpoint() end, desc = 'DAP: toggle breakpoint', nowait = true, remap = false },
                    { '<F53>',      function() require('dap').continue() end,          desc = 'DAP: continue/start',    nowait = true, remap = false },
                    { '<leader>db', function() require('dap').continue() end,          desc = 'DAP: continue/start',    nowait = true, remap = false },
                    { '<F54>',      function() require('dap').step_over() end,         desc = 'DAP: step over',         nowait = true, remap = false },
                    { '<leader>ss', function() require('dap').step_over() end,         desc = 'DAP: step over',         nowait = true, remap = false },
                    { '<F55>',      function() require('dap').step_into() end,         desc = 'DAP: step into',         nowait = true, remap = false },
                    { '<leader>si', function() require('dap').step_into() end,         desc = 'DAP: step into',         nowait = true, remap = false },
                    { '<F56>',      function() require('dap').step_out() end,          desc = 'DAP: step out',          nowait = true, remap = false },
                    { '<leader>so', function() require('dap').step_out() end,          desc = 'DAP: step out',          nowait = true, remap = false },
                },
            })
    end
} }
