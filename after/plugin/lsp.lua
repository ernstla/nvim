-- LSP settings.
--
-- This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    local map = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    map('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- Create a command `:Format` local to the LSP buffer
    -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    --     vim.lsp.buf.format()
    -- end, { desc = 'Format current buffer with LSP' })
end

local servers = require('ernst/lspservers').servers

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        if servers[server_name] ~= nil then
            local settings = servers[server_name]
            settings["capabilities"] = capabilities
            settings["on_attach"] = on_attach

            require('lspconfig')[server_name].setup(settings)
        end
    end,
}

-- Turn on lsp status information
require('fidget').setup()

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    window = {
        completion = cmp.config.window.bordered({
            border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
            winhighlight = 'Normal:Normal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None',
        }),
        documentation = cmp.config.window.bordered({
            border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
            winhighlight = 'Normal:Normal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None',
        }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}
