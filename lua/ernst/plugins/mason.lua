return { {
    'williamboman/mason.nvim',
    opts = {},
    ensure_installed = {
        'gopls',
        'intelephense',
        'lua-language-server',
        'nimlangserver',
        'rust-analyzer',

        'python-lsp-server',
        'ruff',

        'json-lsp',
        'tailwindcss-language-server',

        'svelte-language-server',
        'vue-language-server',
        'eslint-lsp',
        'typescript-language-server',
    },
    config = function(spec)
        require('mason').setup(spec.opts)

        vim.api.nvim_create_user_command("MasonInstallAll", function()
            local registry = require('mason-registry')
            local ensure_installed = {}

            for _, lsp_name in ipairs(spec.ensure_installed) do
                local lsp = registry.get_package(lsp_name)

                if not lsp:is_installed() then
                    table.insert(ensure_installed, lsp_name)
                end
            end

            if next(ensure_installed) ~= nil then
                vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
            else
                print('Mason: nothing to install')
            end
        end, {})
    end,
} }
