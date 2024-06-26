-- LSP settings.

vim.diagnostic.config({
    underline = true,
    signs = true,
    virtual_text = true,
    float = {
        show_header = true,
        source = 'always',
        border = 'rounded',
        focusable = false,
    },
    update_in_insert = false,
})

local on_init = function(client, initialization_result)
    if client.server_capabilities then
        if client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end

        -- prefer php-cs-fixer formatting over intelephense
        if client.name == "intelephense" then
            client.server_capabilities.documentFormattingProvider = false
        end

        -- prefer ruff via Guard over lsp capabilities
        if client.name == "pylsp" or client.name == "rufflsp" then
            client.server_capabilities.documentFormattingProvider = false
        end

        client.server_capabilities.semanticTokensProvider = false -- turn off semantic tokens
    end
end

-- This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
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
    map('<leader>n', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })

    -- Deactivate syntax highlighting tokens provided by lsp
    -- if client.server_capabilities.semanticTokensProvider then
    --     client.server_capabilities.semanticTokensProvider = nil
    -- end

    -- prefer EslintFixAll formatting over volar
    -- if client.name == "volar" then
    --     client.server_capabilities.documentFormattingProvider = false
    -- end

    -- if client.name == "tsserver" then
    -- client.server_capabilities.semanticTokensProvider = false
    -- client.server_capabilities.documentHighlightProvider = false
    -- print(vim.inspect( client.server_capabilities))
    -- end
end

local servers = require('ernst/lspservers').servers

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
        border = 'single',
    }
})

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

local ensure_this = {}
for _, v in ipairs(vim.tbl_keys(servers)) do
    if v ~= 'ols' then -- ols must be manually installed
        table.insert(ensure_this, v)
    end
end
mason_lspconfig.setup {
    ensure_installed = ensure_this,
}

mason_lspconfig.setup_handlers {
    function(server_name)
        if servers[server_name] ~= nil then
            local settings = servers[server_name]
            settings["capabilities"] = capabilities
            settings["on_attach"] = on_attach
            settings['on_init'] = on_init

            require('lspconfig')[server_name].setup(settings)
        end
    end,
}

-- Needs to be after the mason-lspconfig call
require('lspconfig.ui.windows').default_options.border = 'single'

-- nvim-cmp setup
local cmp = require('cmp')
local luasnip = require('luasnip')
luasnip.config.set_config({
    update_events = 'TextChanged,TextChangedI' -- shows changes as you type with extras.rep
})
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('i', '<c-j>', "<cmd>lua require('luasnip').jump(1)<cr>", opts)
map('s', '<c-j>', "<cmd>lua require('luasnip').jump(1)<cr>", opts)
map('i', '<c-k>', "<cmd>lua require('luasnip').jump(-1)<cr>", opts)
map('s', '<c-k>', "<cmd>lua require('luasnip').jump(-1)<cr>", opts)
vim.keymap.set({ "i", "s" }, "<c-e>", function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end, { silent = true })

-- Kill snippets session when leaving insert mode
local unlinkgrp = vim.api.nvim_create_augroup(
    'UnlinkSnippetOnModeChange',
    { clear = true }
)
vim.api.nvim_create_autocmd('ModeChanged', {
    group = unlinkgrp,
    pattern = { 's:n', 'i:*' },
    desc = 'Forget the current snippet when leaving the insert mode',
    callback = function(evt)
        if luasnip.session
            and luasnip.session.current_nodes[evt.buf]
            and not luasnip.session.jump_active
        then
            luasnip.unlink_current()
        end
    end,
})

require('ernst/snippets')

local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
    completion = {
        autocomplete = false,
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<c-d>'] = cmp.mapping.scroll_docs(-4),
        ['<c-f>'] = cmp.mapping.scroll_docs(4),
        ['<c-;>'] = cmp.mapping.complete({ behavior = cmp.SelectBehavior.Insert }),
        ['<cr>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<tab>'] = cmp.mapping(function(fallback)
            if not cmp.visible() and luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            elseif has_words_before() then
                cmp.complete()
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<s-tab>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            elseif cmp.visible() then
                cmp.select_prev_item()
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
        { name = 'buffer' },
    },
    formatting = {
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            -- Source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[LaTeX]",
            })[entry.source.name]
            return vim_item
        end
    },
}
