local ensure_installed = {
    'gopls',
    'intelephense',
    'lua-language-server',
    'nimlsp',
    'rust-analyzer',

    'python-lsp-server',
    'ruff',

    'json-lsp',
    'tailwindcss-language-server',

    'svelte-language-server',
    'vue-language-server',
    'eslint-lsp',
    'typescript-language-server',
}

return { {
    'williamboman/mason.nvim',
    opts = {},
    config = function(_, opts)
        require('mason').setup(opts)

        vim.api.nvim_create_user_command("MasonInstallAll", function()
            local registry = require('mason-registry')
            local to_install = {}

            for _, lsp_name in ipairs(ensure_installed) do
                local lsp = registry.get_package(lsp_name)

                if not lsp:is_installed() then
                    table.insert(to_install, lsp_name)
                end
            end

            if next(to_install) ~= nil then
                vim.cmd("MasonInstall " .. table.concat(to_install, " "))
            else
                print('Mason: nothing to install')
            end
        end, {})
    end,
} }
