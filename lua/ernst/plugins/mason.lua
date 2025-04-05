
return { {
    'williamboman/mason.nvim',
    opts = {},
    ensure_installed = {
        'eslint-lsp',
        'gopls',
        'intelephense',
        'json-lsp',
        'lua-language-server',
        'nimlangserver',
        'python-lsp-server',
        'ruff',
        'rust-analyzer',
        'svelte-language-server',
        'tailwindcss-language-server',
        'typescript-language-server',
        'vue-language-server',
    },
    config = function(spec)
        require('mason').setup(spec.opts)

        vim.api.nvim_create_user_command("MasonInstallAll", function()
            registry = require('mason-registry')
            ensure_installed = {}

            for _, lsp_name in ipairs(spec.ensure_installed) do
                local lsp = registry.get_package(lsp_name)

                if not lsp:is_installed() then
                    table.insert(ensure_installed, lsp_name)
                end
            end

            if next(ensure_installed) ~= nill then
                vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
            else
                print('Mason: nothing to install')
            end
        end, {})
    end,
} }
