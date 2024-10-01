M = {}

M.on_init = function(client, initialization_result)
    if client.server_capabilities then
        if client.name == "tsserver" or client.name == "ts_ls" then
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
M.on_attach = function(client, bufnr)
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

    -- if client.name == "tsserver" or client.name == "ts_ls" then
    -- client.server_capabilities.semanticTokensProvider = false
    -- client.server_capabilities.documentHighlightProvider = false
    -- print(vim.inspect( client.server_capabilities))
    -- end
end

M.has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return M
